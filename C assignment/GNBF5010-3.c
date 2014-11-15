#include<stdio.h>
int fib(int n)
{
/* Declare an array to store fibonacci numbers. */
int f[n+1];
int i;
/* 0th and 1st number of the series are 0 and 1*/
f[0] = 0;
f[1] = 1;
for (i = 2; i <= n; i++)
{
/* Add the previous 2 numbers in the series
and store it */
f[i] = f[i-1] + f[i-2];
}
return f[n];
}
int main ()
{int n,c,j=0;
printf("Enter the number of terms\n");
scanf("%d",&n);
printf("First %d terms of Fibonacci series are :-\n",n);
   for ( c = 1 ; c <= n ; c++ )
   {
      printf("%d\n", fib(j));
      j++;
   }

getchar();
return 0;
}
