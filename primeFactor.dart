void main(){

  // https://www.youtube.com/watch?v=o35evzk02ug
  print(3);

}

List<int> primeFactors(int num){

  if(num == 1) return [1];

  int n = 2;

  List<int> factors = [];

  while(n*n <= num){
    if( num % n == 0){
      factors.add(n);
      num = num~/n;
    }else{
      n++;
    }
    if(num > 1){
      factors.add(num);
    }
  }

  return factors;
}