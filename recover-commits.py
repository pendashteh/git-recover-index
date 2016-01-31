import os
commits_file = os.environ['_git_recover_index_tmpfile']
commits_recover_path = os.environ['_git_recover_index_recover_path']
commits = [line.rstrip('\n') for line in open(commits_file)]
from subprocess import call
filename = commits_recover_path + "/file-"
i = 1
for c in commits:
    f = open(filename + str(i),"wb")
    call(["git", "show", c],stdout=f)
    i+=1
