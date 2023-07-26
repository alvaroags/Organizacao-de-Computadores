#include <stdio.h>
#include <stdlib.h>

void bubbleSort(int *v, int n){
    int i, j, aux;
    for(i=0; i<n - 1; i++){
        for(j= 0; j< n -i -1; j++){
            if(v[j]>v[j+1]){
                aux = v[j];
                v[j] = v[j+1];
                v[j+1] = aux;
            }
        }
    }

    for(i=0; i<n; i++)
        printf("Vetor ordenado: %d [%d] \n", v[i], i);
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

    bubbleSort(v, n);

    fclose(arquivo);
    free(v);
    return 0;
}
