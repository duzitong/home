import os
import sys
import subprocess
import re

git_dir = '.'
if len(sys.argv) > 1:
    git_dir = sys.argv[1]

conflict_pattern = re.compile('(<<<<<<<.*\n(.*\n)*=======\n(.*\n)*>>>>>>>.*\n)')
version_pattern = re.compile('<version>.*</version>')

def is_version(s):
    return len(s.strip().split('\n')) == 1 and version_pattern.search(s)

def try_to_resolve(content):
    for block in conflict_pattern.findall(content):
        original = block[0]
        yours = block[1]
        theirs = block[2]
        if is_version(yours) and is_version(theirs):
            content = content.replace(original, theirs)

    return content


def resolved(content):
    return not '=======' in content

if __name__ == '__main__':
    os.chdir(git_dir)

    pom_files = subprocess.check_output("git status | grep 'both modified' | grep 'pom.xml' | cut -d':' -f2 | tr -d ' '", shell=True).decode()
    # print(pom_files)
    for pom in pom_files.split('\n'):
        if pom:
            with open(pom) as f:
                content = f.read()
            content = try_to_resolve(content)
            if content and resolved(content):
                with open(pom, 'w') as f:
                    f.write(content)
                subprocess.check_output('git add {}'.format(pom),shell=True)
        

