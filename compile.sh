#!/bin/sh

input=$1
output=$2

if [ "x$input" == "x" ]; then
    input=/tmp/input
fi

if [ "x$output" == "x" ]; then
    output=/tmp/output
fi

mkdir -p $input
mkdir -p $output

for f in $(ls $input/*.bc); do
    name=$(basename $f .bc)
    llc $input/$name.bc -o $output/$name.s
done
