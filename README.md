# Rescue your ever lost commits
Recovers your staged file (index) after a hard reset: $ git reset HEAD --hard &amp;&amp; git recover-index

# Oh no!
Did you lose all your work after  stupid `git reset XXX --hard`. Don't worry, we got you covered.

# Quick usage
```
$ cd /path/to/messedup/repo
$ git clone git@github.com:pendashteh/git-recover-index.git
$ ./git-recover-index
> 1 lost commit found. Processing...
> Done.
> Find recovered commits at /path/to/messedup/GIT_RECOVERED
```

Now you can check out your files under `./GIT_RECOVERED`. Please note that this process does not recover the file names, so yeah. Good luck!

# Installation
If for whataver reason, you want to have this script installed as a **git extension**, you only need to add the executable `git-receover-index` to a directory that belongs to `$PATH`, e.g. `$HOME/bin`.

Then you'd be able to use this as a git extention:
```bash
$ git recover-index
```
