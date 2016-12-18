#include <stdio.h>
//fibAA(iterative)
int  fib (int n){	
	if(n == 0)						//set the 0th term to be 0
		return 0;		
	else if(n ==1)					//set the first term to be 1
		return 1;
	int i, j;

		int n_2=0, n_1=1;			//set the first two terms to be 0 and 1
		for( i = 2; i<= n ; i++){	//for the terms over 1
			j = n_1 + n_2;			//calculate the n+1 term
			n_2 = n_1;				//do the shift
			n_1 = j;
		}
	return j;						//return the answer

}

int main(){
	int n, fac;
	scanf("%d", &n);
	fac = fib(n);
	printf("%d\n", fac);
	return 0;
}