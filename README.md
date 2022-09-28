# snow_crash

## level00

It took me a while to understand what to do.
At the start, I tried to list all the files related to level00 user.
There were a lot of files, but they didn't get me even a clue.

Then, I decided to look at the /etc/passwd file and found a first step for level01, lol.

After that, I came up with idea to look for the files, related to the flag00 user. And bingo!
There were two identical `john` files, that have rights for other users to read.
These files contained some string, that looks like a password.
I tried to login with this password but unsuccessfully.

After that I remembered that in the intra video for this project, [some site](https://www.dcode.fr/) was mentioned as a useful for first levels.
This site contained caesar cypher decoder, which is perfectly worked for the password. (ROT11)

## level01

For level01, the hash that stored in the /etc/passwd file should be cracked with [john](https://www.openwall.com/john/)
Download john: [link](https://download.openwall.net/pub/projects/john/contrib/macosx/)
Once installed, download /etc/passwd file and crack it.
[scp examples](http://www.hypexr.org/linux_scp_help.php)
[john examples](https://www.openwall.com/john/doc/EXAMPLES.shtml)

It seems that password was hash was produced by some of the DES functions.

## level02

