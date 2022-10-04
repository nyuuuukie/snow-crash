## level02

On this level you need to analyze network dump. <br>
There is a file called `level02.pcap` present in the home directory. <br>

### First solution

To see the content of this dump, you need appropriate tool. <br>
One of this tools is [tshark](https://www.wireshark.org/docs/man-pages/tshark.html) (console analog of wireshark) <br>

Here's some [tshark usage examples](https://www.cellstream.com/reference-reading/tipsandtricks/272-t-shark-usage-examples)

First, install tshark (Debian)
```bash
sudo apt install tshark
```

Second, copy the dump file with scp to the machine with tshark (Replace ip address with yours).<br>
Change read access bit of the file as well.
```bash
scp -P 4242 level02@192.168.64.2:level02.pcap ./

chmod +r level02.pcap
```

Third, look at the content of the packets.
```bash
# Get decoded tcp data
tshark -r level02.pcap -z follow,tcp,raw,0 -Q | tail -n +7 | head -n -1 | xxd -r -p

# Look at the tcp packets data in the hex mode
tshark -r level02.pcap -z follow,tcp,hex,0 -Q
```

### Second solution

Go to the directory with rw rights and copy `decoder.c` and `getpass.sh`
```bash
cd /var/crash

#copy decoder.sh and getpass.sh
scp -P 4242 ./decoder.c  level02@192.168.64.3:/var/crash
scp -P 4242 ./getpass.sh level02@192.168.64.3:/var/crash
```

Set executable bit and run the script
```bash
chmod +x getpass.sh

./getpass.sh
```

This script uses tcpdump that available inside the iso. <br>
It is getting all the ip packets data, removing unnecessary ip & tcp headers <br>
And converts the result into readable password using self-writed decoder.