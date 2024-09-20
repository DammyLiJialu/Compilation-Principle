#include <stdio.h>

float average(float arr[], int n) {
    float sum = 0.0;
    for (int i = 0; i < n; i++) {
        sum += arr[i];
    }
    return sum / n;
}

int main() {
    float arr[3];
    for (int i = 0; i < 3; i++) {
        scanf("%f", &arr[i]);
    }
    float avg = average(arr, 3);
    printf("%.2f\n", avg); // 输出平均值
    return 0;
}
