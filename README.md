# Rescue your ever lost commits
Recovers your staged file (index) after a hard reset: $ git reset HEAD --hard &amp;&amp; git recover-index

# Oh no!
Did you lose all your work after  stupid `git reset XXX --hard`. Don't worry, we got you covered.

# Quick usage
```
$ cd /path/to/messedup/repo
$ git clone git@github.com:pendashteh/git-recover-index.git
$ ./git-recover-index.sh
> 1 lost commit found. Processing...
> Done.
> Find recovered commits at /path/to/messedup/git-recovered
```

Now you can check out your files under `./git-recovered`. Please note that this process does not recover the file names, so yeah. Good luck!
