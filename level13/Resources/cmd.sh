
### Avoid check by jumping

# Look at the asm
objdump -d level13 | nl | grep getuid

gdb level13

# in gdb
# disassemble
break getuid
run
jump *0x80485cb


### Dynamic injection (another option)

cd /var/crash

# Copy source file or upload it
vim fake.c

gcc -fPIC -shared fake.c -o libfake.so

export LD_PRELOAD=/var/crash/libfake.so

# Removing s-bit
cp ~/level13 .

./level13