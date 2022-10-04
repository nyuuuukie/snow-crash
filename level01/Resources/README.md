## level01

The hash that stored in the /etc/passwd file should be cracked with [john](https://www.openwall.com/john/) <br>
[Download john](https://download.openwall.net/pub/projects/john/contrib/macosx/) for MacOS

Or <br>

```bash
# Download john, ARM64
wget https://download.openwall.net/pub/projects/john/contrib/macosx/john-1.8.0.9-jumbo-macosx_sse4.zip

# Unzip
unzip john-1.8.0.9-jumbo-macosx_sse4.zip
```

Once installed, download /etc/passwd file and crack it. <br>
[scp examples](http://www.hypexr.org/linux_scp_help.php) <br>
[john examples](https://www.openwall.com/john/doc/EXAMPLES.shtml)

```bash
# copy /etc/passwd file from the VM
scp -P 4242 level00@192.168.64.2:/etc/passwd ./

# crack the password with john
./run/john --show passwd
```

It seems that password was hash was produced by some of the DES-family functions.