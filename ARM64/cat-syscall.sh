#! /usr/bin/env zsh

# arg example :  `./cat-syscall connect`
cat /Library/Developer/CommandLineTools/SDKs/MacOSX14.4.sdk/usr/include/sys/syscall.h | grep $1
