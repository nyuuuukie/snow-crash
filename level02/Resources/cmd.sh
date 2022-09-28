# Install tshark (Debian)
sudo apt install tshark

# Copy scp
scp -P 4242 level02@192.168.64.2:level02.pcap ./

# Change rights
chmod +r level02.pcap

# man tshark 
# https://www.wireshark.org/docs/man-pages/tshark.html

# tshark examples
# https://www.cellstream.com/reference-reading/tipsandtricks/272-t-shark-usage-examples

# Get decoded tcp data
tshark -r level02.pcap -z follow,tcp,raw,0 -Q | tail -n +7 | head -n -1 | xxd -r -p

# Look at the tcp packets data in the hex mode
tshark -r level02.pcap -z follow,tcp,hex,0 -Q

# Password: ft_waNDReL0L
