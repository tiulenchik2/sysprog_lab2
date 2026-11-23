// множення матриць + saxpy, для профілювання
// збірка: make

#include <stdio.h>
#include <stdlib.h>

#define N 1024
#define VEC (1 << 20)
#define REPS 200

float A[N][N], B[N][N], C[N][N];
float X[VEC], Y[VEC];

// noinline щоб функції не зникали на -O3 і були видні на flamegraph
__attribute__((noinline)) void init(void)
{
    srand(1);
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++) {
            A[i][j] = (float)rand() / RAND_MAX;
            B[i][j] = (float)rand() / RAND_MAX;
        }
    for (int i = 0; i < VEC; i++) {
        X[i] = (float)rand() / RAND_MAX;
        Y[i] = (float)rand() / RAND_MAX;
    }
}

#ifndef IKJ
// звичайне множення, B читається по стовпцях (погано для кешу)
__attribute__((noinline)) void matmul(void)
{
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++) {
            float s = 0;
            for (int k = 0; k < N; k++)
                s += A[i][k] * B[k][j];
            C[i][j] = s;
        }
}
#else
// переставлені цикли: B і C читаються по рядках
__attribute__((noinline)) void matmul(void)
{
    for (int i = 0; i < N; i++)
        for (int k = 0; k < N; k++)
            for (int j = 0; j < N; j++)
                C[i][j] += A[i][k] * B[k][j];
}
#endif

// y = a*x + y
__attribute__((noinline)) void saxpy(float a)
{
    for (int i = 0; i < VEC; i++)
        Y[i] = a * X[i] + Y[i];
}

__attribute__((noinline)) double sum(void)
{
    double s = 0;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            s += C[i][j];
    for (int i = 0; i < VEC; i++)
        s += Y[i];
    return s;
}

int main(void)
{
    init();
    matmul();
    for (int r = 0; r < REPS; r++)
        saxpy(0.0001f);
    printf("sum = %f\n", sum());
    return 0;
}
