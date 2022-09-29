
# List all the directory where user can read and write
ll -R / 2>/dev/null | egrep '^d......rw.' | grep -v '\./'

cat $(find / -name "$(ll -R -T0 / 2>/dev/null | grep 'flag00' | head -1 | rev | cut -d' ' -f1 | rev)" 2>/dev/null | head -1) | tr '[a-z]' '[l-za-k]'