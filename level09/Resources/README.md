## level09

level09 binary encodes the string with a simple cipher:
```bash
$ ./level09 0000000

0123456
```
As we see, the script adds the index of a char to its code. <br>
To decode it we need to do the same opeartion but with substraction. 

```bash
# Go to the folder when user has rw rights
cd /var/crash

# Copy source code
scp -P 4242 ./decode.c level02@192.168.64.3:/var/crash

# Compile
gcc decode.c -o decode

# Using decoder
./decode ~/token
```