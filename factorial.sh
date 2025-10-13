#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <number>"
  exit 1
fi

num=$1
fact=1

while [ $num -gt 1 ]
do
  fact=$((fact * num))
  num=$((num - 1))
done
echo "factorial of $1 is $fact"
