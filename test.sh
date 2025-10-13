#!/bin/sh
v=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

for var in 1 2 3 4 5 6 7 8 9
do
   a=$(($v*$var))
   echo $a
done