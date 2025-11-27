#!bin/bash

MTIME=30

usage() {
	echo "Usage: log-cleaner path/to/directory age"
	echo "Example: log-cleaner ~/logs 30 (Delete files older 30 days in directory ~/logs)"
}

if [[ ($# -ne 1) && ($# -ne 2) ]]; then
	usage
	exit 1
fi

LOG_DIR=$1

if [[ ! -d $LOG_DIR ]]; then
	echo "$1 is not a directory"
	usage
	exit 1
fi

if [[ $# -eq 2 ]]; then 
	if [[ "$2" =~ ^[0-9]+$ ]]; then
	echo "$2 is not the number"
	usage
	exit 1
	fi
	MTIME=$2
fi

find $LOG_DIR -type f -mtime "+$MTIME" -delete

echo "Successfully cleaned up directory"
