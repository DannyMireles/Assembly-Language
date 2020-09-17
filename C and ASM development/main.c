/* main.c simple program to test compilation and assembly */

#include <stdio.h>

/* "test" is our function that is written in ARMv8 Assembly */
extern long long int test();

int main(void)
{
    long long int a = test(); /* Calling assembly funct test from a C program */
    printf("Result of test(3, 7) = %d\n", a);
    return 0;
}