#include <stdio.h>
#include <stdlib.h>

void Fibonacci(long long int *v, int n){
    int i;
    v[0] = 0;
    v[1] = 1;
    for(i=2; i<n; i++){
        v[i] = v[i-1] + v[i-2];
        printf("Vetor ordenado: %lld [%d] \n", v[i], i);
    }
}

long long int FibonacciRecursivo(int n){
    if(n <= 1)
        return n;
    return FibonacciRecursivo(n-1) + FibonacciRecursivo(n-2);
}

int main(){
    int i, n = 20;
    long long int v;

    for(i=0; i<n; i++)
        printf("Vetor ordenado: %lld [%d] \n", FibonacciRecursivo(i), i);

    return 0;
}