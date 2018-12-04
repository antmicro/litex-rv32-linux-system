#!/bin/bash

awk '{ printf "%08x\n", strtonum("0x" $1) }' $1 > mem.init
mv mem.init $1
