
### Avoid check by jumping

# Look at the asm
objdump -d level13 | grep -A 10 getuid

gdb level13

# in gdb
# disassemble
break getuid
run
jump *0x80485cb


### Dynamic injection (another option)

cd /var/crash

# Copy source file
vim fake.c
 
# Or upload it (do not forget to change ip address!)
scp -P 4242 ./fake.c level13@192.168.64.3:/var/crash

gcc -fPIC -shared fake.c -o libfake.so

export LD_PRELOAD=/var/crash/libfake.so

# Removing s-bit
cp ~/level13 .

./level13