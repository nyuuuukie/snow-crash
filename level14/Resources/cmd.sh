
# 1. Get flag14 id in hex format
F14ID="$(printf "%#x\n" "$(id -u flag14)")"

# 2. Searching in disassembled code for the flag14 uid
objdump -d /bin/getflag | nl | grep -A 1 $F14ID

gdb getflag

# Set breakpoint in main, otherwise getflag will exit with an error
break main

run

# Jump to the address we found in step 2
jump *0x0x8048de5