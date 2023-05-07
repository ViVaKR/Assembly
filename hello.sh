#! /usr/local/bin/zsh

nasm -f macho64 hello.s
gcc-13 -mdynamic-no-pic -o hello hello.o

./hello
# gcc-13 -o [ 출력파일명 ] [ 소스파일명 ]
