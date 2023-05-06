#! /usr/local/bin/zsh

nasm -f macho64 main.s
gcc-13 -mdynamic-no-pic -o main main.o

./main
