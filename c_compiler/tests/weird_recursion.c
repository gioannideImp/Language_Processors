


char f(char x){

	if(x<=9){
		x+=1;
		f(x);
	}
return x;
}

int main(){

	char x = 10;

	

	return ((f(x)?f(3):f(14)));

}

