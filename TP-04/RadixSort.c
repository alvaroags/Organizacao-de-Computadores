#include <stdio.h>
#include <stdlib.h>

int getMax(int *v, int tam){
    int i, max = v[0];
    for(i=1; i<tam; i++){
        if(v[i] > max)
            max = v[i];
    }
    return max;
}

void countSort(int *v, int tam, int exp){
    int i, output[tam], count[10] = {0};

    for(i=0; i<tam; i++)
        count[(v[i]/exp)%10]++;

    for(i=1; i<10; i++)
        count[i] += count[i-1];

    for(i=tam-1; i>=0; i--){
        output[count[(v[i]/exp)%10] - 1] = v[i];
        count[(v[i]/exp)%10]--;
    }

    for(i=0; i<tam; i++)
        v[i] = output[i];
}

void RadixSort(int *v, int tam){
    int exp, m;
    m = getMax(v, tam);

    for(exp = 1; m/exp > 0; exp *= 10)
        countSort(v, tam, exp);
}

int main(){
    int i = 0, n = 1000;
    int *v = (int*)malloc(n*sizeof(int));
    FILE *arquivo;
    arquivo = fopen("EntradaMil.txt", "r");

    while(!feof(arquivo)){
        fscanf(arquivo, "%d", &v[i]);
        i++;
    }

    RadixSort(v, n);

    for(i=0; i<n; i++)
        printf("Vetor ordenado: %d [%d] \n", v[i], i);

    fclose(arquivo);
    free(v);
    return 0;
}