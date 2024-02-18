#pragma clang diagnostic ignored "-Wformat"
#include "./Headers/CalculateApp.h"

int main(void) {
    double a = 250.45;
    double b = 3.14;
    int c = 125;
    int d = 250;
    printf("\n%5$.2f + %6$.2f = %1$6.2f"
           "\n%5$.2f - %6$.2f = %2$6.2f"
           "\n%5$.2f * %6$.2f = %3$6.2f"
           "\n%5$.2f / %6$.2f = %4$6.2f\n",
           //
           Add(a, b),           //
           Subtract(a, b),      //
           Multiply(a, b),      //
           Divide(a, b), a, b); //

    printf("%d %1$d %2$d\n", c, d);

    return 0;
}

/* Compile

 */
//-> ./clang-format -style=llvm -dump-config > ~/.clang-format
