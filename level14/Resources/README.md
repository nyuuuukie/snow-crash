## level14

To pass this level we will reverse `getflag`:

```bash
# 1. Get flag14 id in hex format
F14ID="$(printf "%#x\n" "$(id -u flag14)")"

# 2. Searching in disassembled code for the flag14 uid
objdump -d /bin/getflag | nl | grep -A 1 $F14ID
```

The last part should be done in gdb:
```bash
gdb getflag

# 3. Set breakpoint in main, otherwise getflag will exit with an error
break main

run

# 4. Jump to the address we found in step 2
jump *0x0x8048de5
```