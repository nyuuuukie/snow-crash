#!/bin/bash

gcc decoder.c -o decoder

# tcpdump cheat sheet
# https://gist.github.com/tuxfight3r/9ac030cb0d707bb446c7

tcpdump -r ~/level02.pcap -n -xq -tttt \
    'tcp[13] & 8 != 0 and src 59.233.235.218' 2>/dev/null |\
    grep -A 10000 "07:23:34" |\
    grep "0x0030" |\
    cut -d':' -f2 |\
    cut -d' ' -f5 |\
    ./decoder
