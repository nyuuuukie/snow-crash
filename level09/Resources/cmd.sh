# Go to the folder when user has rw rights
cd /var/crash

# Copy source code
vim decode.c
# or
scp -P 4242 ./decode.c level02@192.168.64.3:/var/crash

# Compile
gcc decode.c -o decode

# Using decoder
./decode ~/token

# Token is a password to flag09!
su flag09