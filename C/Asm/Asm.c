#include <stdio.h>

int main(void) {
    char a = 0, b = 0, c = 0;

    printf("Input 3 char\n");

    scanf("%c", &a);

    scanf(" %c", &b);

    scanf(" %c", &c);

    printf("Input Data is : %d - %d - %d\n", a, b, c);
}
