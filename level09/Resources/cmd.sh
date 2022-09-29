# Go to the folder when user has rw rights
cd /var/crash

# Copy source code
vim decode.c

# Compile
gcc decode.c -o decode

# Using decoder
./decode ~/token

# Token is a password to flag09!
su flag09