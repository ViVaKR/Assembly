#! /usr/bin/env zsh

# arg example :  `./cat-syscall connect`
cat /Library/Developer/CommandLineTools/SDKs/MacOSX15.2.sdk/usr/include/sys/syscall.h | grep $1
