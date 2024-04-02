#pragma clang diagnostic ignored "-Wformat"
#include <stdlib.h>
#include <time.h>

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

    srand(time(NULL));
    const int size = 30; // 카드 수량
    // 일단 순서대로 가지런히 배열 초기화
    int arr[size] = {0};
    for (size_t i = 0; i < size; i++) {
        arr[i] = i;
    }

    // 가즈런한 카드를 랜더믹 하게 shuffle + ing 하기
    // 3번 섞기 데모
    for (size_t j = 0; j < 3; j++) {
        printf("%d 번째 Shuffle\n", j + 1);
        for (size_t i = size - 1; i > 0; --i) {
            int k = rand() % i;
            int temp = arr[i];
            arr[i] = arr[k];
            arr[k] = temp;
            printf("%*s~", 1, "다다락");
        }
        puts("\n");
    }

    // 중복되 카드가 있는 지 체크 해보기
    int check[size] = {0};
    for (size_t i = 0; i < size; i++) {
        check[arr[i]]++;
    }

    for (size_t i = 0; i < size; i++) {
        if (check[i] > 1) {
            puts("중복된 카드가 있습니다. 다시 Shuffle 하여 주세요...");
            printf("%d - %d\n", i, check[i]);
            return 0;
        }
    }

    // 중복된 카드 없는 정상 Shuffle 상태
    // Start Game...
    puts("\n===== 처음 28장 =====");
    for (size_t i = 0; i < size; i++) {
        printf("%02d 장 -> %d\n", i + 1, arr[i]);
    }

    puts("\n===== 남은 2장 =====");
    for (size_t i = size - 2; i < size; i++) {
        printf("%02d 장 - %d\n", i + 1, arr[i]);
    }
    printf("\n굿락.. ~~ \n배팅 시작 하시겠습니다....\n\n");
    return 0;
}

/* Compile

 */
//-> ./clang-format -style=llvm -dump-config > ~/.clang-format
