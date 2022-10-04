
## level00

At the start, I tried to list all the files related to level00 user. <br>
There were a lot of files, but they didn't get me even a clue.

After that I decided to understand which folders have permissions to write for current user:

```bash
# List all the directory where user can read and write
ll -R / 2>/dev/null | egrep '^d......rw.' | grep -v '\./'
```

Then, I decided to look at the /etc/passwd file and found a first step for level01, lol.

After that, I came up with idea to look for the files, related to the flag00 user. And bingo! <br>
There were two identical `john` files, that have rights for other users to read. <br>
These files contained some string, that looks like a password. <br>
I tried to login with this password but unsuccessfully.

After that I remembered [this site](https://www.dcode.fr/) was mentioned as a useful for the first levels in the intra video of this project.
This site contained caesar cypher decoder, which is perfectly worked for the password. (ROT11)

```bash
# This line decodes rot11
echo "pass" | tr '[a-z]' '[l-za-k]'
```

Here's bash one-liner to solve this level

```bash
cat $(find / -name "$(ll -R -T0 / 2>/dev/null | grep 'flag00' | head -1 | rev | cut -d' ' -f1 | rev)" 2>/dev/null | head -1) | tr '[a-z]' '[l-za-k]'
```