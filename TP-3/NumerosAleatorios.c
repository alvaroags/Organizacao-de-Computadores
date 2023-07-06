#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int main(){
    int i, numeros;
    FILE *arquivo;
    arquivo = fopen("EntradaMil.txt", "w");

    srand(time(NULL));

    for(i=0; i<10000; i++){
        numeros = rand() % 100000;
        fprintf(arquivo, "%d\n", numeros);
    }

    fclose(arquivo);
    return 0;

}