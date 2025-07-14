#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

/opt/multitor/bin/multitor -u multitor --init 2 --socks-port 9000 --control-port 6000 --verbose
