void main(){

  List<int> numeros = [130,1310,4];

  print(lcmOf(numeros));

  //print(factorsOf(3, 12));

}

int lcmOf (List<int> numlst){
  numlst = numlst.toSet().toList(); // removes duplicates
  numlst.sort(); //orders list from smallest to largest number

  //sets the limit for the multiplication
  int limit = 1;
  for(int n in numlst){
    limit = limit*n;
  }

  //creates the lists of list of multiples
  List<List<int>> multiplesList = [];
  for(int n in numlst){
    multiplesList.add(multiplesOf(n, limit));
  }
  
  //finds the common multiples between numbers
  Set<int> unique = multiplesList[0].toSet();
  for(List multiples in multiplesList){
    unique = unique.intersection(multiples.toSet());
  }
  
  //returns the smallest multiple
  return unique.toList()[1];
}


List<int> multiplesOf(int n, int limit){
  List<int> factors = [0];
  while(factors.last < limit){
    factors.add(factors.last+n);
  }
  return factors;
}