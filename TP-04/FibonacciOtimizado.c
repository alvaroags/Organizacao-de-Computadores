#include <stdio.h>

#define MAX_SIZE 100

long long int fibonacci[MAX_SIZE]; 

long long int FibonacciRecursivo(int n) {
    if (n <= 1) 
        return n;

    if (fibonacci[n] != -1) 
        return fibonacci[n];

    fibonacci[n] = FibonacciRecursivo(n - 1) + FibonacciRecursivo(n - 2);
    return fibonacci[n];
}

int main() {
    int i, n = 20;

    for (i = 0; i < MAX_SIZE; i++) 
        fibonacci[i] = -1;

    printf("Série de Fibonacci:\n");
    for (i = 0; i < n; i++) 
        printf("%lld ", FibonacciRecursivo(i));
        
    printf("\n");

    return 0;
}
