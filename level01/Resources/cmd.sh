
# Download john, ARM64
wget https://download.openwall.net/pub/projects/john/contrib/macosx/john-1.8.0.9-jumbo-macosx_sse4.zip

# Unzip
unzip john-1.8.0.9-jumbo-macosx_sse4.zip

# Download /etc/passwd file (level00 user has simple password)
scp -P 4242 level00@192.168.64.2:/etc/passwd ./

./run/john --show passwd