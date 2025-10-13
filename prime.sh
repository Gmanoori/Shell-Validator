#!/bin/bash

# Check if a number is provided as a parameter
if [ -z "$1" ]; then
  echo "Usage: $0 <number>"
  exit 1
fi

n=$1

# Check if the number is less than 2
if [ "$n" -lt 2 ]; then
  echo "$n is not a prime number."
  exit 0
fi

# Prime-checking loop
for ((i=2; i<=n/2; i++))
do
  ans=$((n % i))
  if [ $ans -eq 0 ]; then
    echo "$n is not a prime number."
    exit 0
  fi
done

echo "$n is a prime number."
