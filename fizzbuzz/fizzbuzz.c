#include <stdio.h>
#define RANGE 100

int main(){
    int num = 1;
    while(num<=RANGE){
        if(num % 15 == 0){
            printf("FIZZBUZZ\n");
        }
        else if(num % 5 == 0){
            printf("BuZZ\n");
        }
        else if (num % 3 == 0){
            printf("FIZZ\n");
        }
        else{
            printf("%d\n", num);
        }
        num++;
    }
}
