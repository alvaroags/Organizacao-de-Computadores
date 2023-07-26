#include <stdio.h>
#include <stdlib.h>

void QuickSort(int *v, int inicio, int fim){
    int i, j, pivo, aux;
    i = inicio;
    j = fim - 1;
    pivo = v[(inicio + fim) / 2];

    while(i <= j){
        while(v[i] < pivo && i < fim)
            i++;
        while(v[j] > pivo && j > inicio)
            j--;
        if(i <= j){
            aux = v[i];
            v[i] = v[j];
            v[j] = aux;
            i++;
            j--;
        }
    }

    if(j > inicio)
        QuickSort(v, inicio, j+1);
    if(i < fim)
        QuickSort(v, i, fim);

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

    QuickSort(v, 0, n);

    for(i=0; i<n; i++)
        printf("Vetor ordenado: %d [%d] \n", v[i], i);

    fclose(arquivo);
    free(v);
    return 0;
}