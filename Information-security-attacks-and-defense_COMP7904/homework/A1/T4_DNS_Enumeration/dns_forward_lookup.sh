#!/usr/bin/bash

if [ "$#" -ne 2 ]; 
then
	echo "[*] Simple DNS forward lookup script with host command"
	echo "[*] Usage: $0 <list file> <domain name>"
	exit 0
fi

# Variables 
#	$1: <list file>
#	$2: <domain name>
# Write your bash script here

