#include <stdio.h>

int main()
{
    int height, i, j;

    // 사용자로부터 역삼각형의 높이를 입력받습니다.
    printf("역삼각형의 높이를 입력하세요: ");
    scanf("%d", &height);

    // 역삼각형 출력
    for (i = height; i >= 1; i--) {
        // 공백 출력
        for (j = 0; j < height - i; j++) {
            printf(" ");
        }
        // 별표 출력
        for (j = 1; j <= 2 * i - 1; j++) {
            printf("*");
        }
        // 줄 바꿈
        printf("\n");
    }

    return 0;
}
