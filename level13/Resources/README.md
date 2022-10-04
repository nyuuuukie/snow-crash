## level13

### First solution (Reverse engineering)

Look at the asm
```bash
$ objdump -d level13 | nl | grep getuid
```

And then:
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

# Copy source file or upload it
scp -P 4242 ./fake.c level02@192.168.64.3:/var/crash

# Compile and link dynamic library
gcc -fPIC -shared fake.c -o libfake.so

# Add the path to preload lib
export LD_PRELOAD=/var/crash/libfake.so

# Removing s-bit from the executable
cp ~/level13 .

# Get the flag
./level13
```