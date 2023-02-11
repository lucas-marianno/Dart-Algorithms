void main(){
  int a = 10000000;
  int b = 2;

  print(euclideanSubGCD(a,b));
  
  print(euclideanModGCD(a,b));
  //print(euclideanReducer([a,b]));
}


int euclideanSubGCD(int a, int b) {
  
  /// Finds the Greatest Common Denominator of a pair of numbers using the 
  /// Euclidean method by subtraction.
  int steps = 0;

  while(a !=b ){
    steps++;
    //print("a = $a b = $b");
    if(a < b ){
      b = b - a;
    }else{
      a = a - b;
    }
  }
  print("$steps steps");
  return a;
}



int euclideanModGCD(int a, int b) {
  
  /// Finds the Greatest Common Denominator of a pair of numbers using the 
  /// Euclidean method by using the Modulus Operator (remainder)(%).
  
  int temp = b;
  int steps = 0;

  while(b != 0){
    steps++;
    //print("a = $a b = $b");
    temp = b;
    b = a % b;
    a = temp;
  }
  print("$steps steps");
  return a;
}

List<int> euclideanReducer(List<int> numlst){

  /// Reduces a fraction using the Euclidean method
  int gcd = euclideanModGCD(numlst[0], numlst[1]);



  return [numlst[0]~/gcd,numlst[0]~/gcd];
}


