#include <stdio.h> 
//fibCC

int fib(int n, int a, int b){		//the tail recursive function for fibonassi string
	if ( n == 0)					//the end point
		return a;
	else
		return fib(n-1, b, a+b);	//count the n-1'th term
}

int main(){
	int n, fi;
	scanf("%d", &n);
	fi = fib(n, 0, 1);
	printf("%d\n" , fi);
	return 0;
}