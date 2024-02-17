#!/bin/bash

as ${1}.s -o ${1}.o && ld ${1}.o -o $1 -e _start -arch arm64
./${1}
echo $?

# ./trun.sh <exec file>
