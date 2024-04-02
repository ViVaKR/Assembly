#include <stdio.h>

int main(void) {
    printf("hello, world\n");

    return 0;
}

/*
//-> compile create object file
$ clang helloworld.c -o helloworld.o

//-> link
$ ld helloworld.o -o helloworld -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64
*/
