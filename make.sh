#! /usr/local/bin/zsh

nasm -f macho64 main.s
gcc-13 -mdynamic-no-pic -o main main.o

./main
# gcc-13 -o [ 출력파일명 ] [ 소스파일명 ]
