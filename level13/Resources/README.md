## level13

### First solution (Reverse engineering)

Look at the asm
```bash
$ objdump -d level13 | grep -A 10 getuid
```

As we see, after calling getuid function, the result is stored in the eax register. <br>
This stored value is compared to 4242 (0x1092), and if both operands are equal, <br>
we jumping to the 80485cb. <br>

The solution here is to jump manually to the position where the key could be obtained:
```
$ gdb level13

break getuid
run
jump *0x80485cb
```

### Second solution (Dynamic injection)

```bash
# Go to the directory with rw access
cd /var/crash

# Copy source file or upload it (do not forget to change ip address!)
scp -P 4242 ./fake.c level13@192.168.64.3:/var/crash

# Compile and link dynamic library
gcc -fPIC -shared fake.c -o libfake.so

# Add the path to preload lib
export LD_PRELOAD=/var/crash/libfake.so

# Removing s-bit from the executable
cp ~/level13 .

# Get the flag
./level13
```