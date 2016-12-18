#include <stdio.h> 
//fibBBBB

int fib(int n){
	if(n==0)
        return 0;					//set the 0th term to be 0
 
    if(n==1)
        return 1;					//set the first term to be 1
 
    return (fib(n-1)+fib(n-2));		//calculate the n'th term
}

int main(){
	int n, fi;
	scanf("%d", &n);
	fi = fib(n);
	printf("%d\n" , fi);
	return 0;
}