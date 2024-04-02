#!/bin/bash

as addex1.s -o addex1.o && ld addex1.o -o addex1 -e _start -arch arm64
./addex1
echo $?
