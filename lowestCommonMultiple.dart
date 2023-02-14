void main(){

  List<int> numeros = [2,3,4];
  print('LCM of $numeros is:');
  print(lcmOf(numeros));

  //print(factorsOf(3, 12));

}

int lcmOf (List<int> numlst){
  numlst = numlst.toSet().toList(); // removes duplicates
  numlst.sort(); //orders list from smallest to largest number

  //rules out trivial cases
  for(int n in numlst){
    if(numlst.last % n != 0){
      break;
    }else{
      if(numlst.last % n == 0 && numlst.last ==n){
        return numlst.last;
      }
    }
  }


  //sets the limit for the multiplication
  int limit = 1;
  for(int n in numlst){
    limit = limit*n;
  }

  //creates the lists of list of multiples
  List<List<int>> multiplesList = [];
  for(int n in numlst){
    multiplesList.add(multiplesOf(n,numlst.last, limit));
  }
  
  //finds the common multiples between numbers
  Set<int> unique = multiplesList[0].toSet();
  for(List multiples in multiplesList){
    unique = unique.intersection(multiples.toSet());
  }
  
  //returns the smallest multiple
  return unique.toList()[0];
}


List<int> multiplesOf(int n,int largestInt, int limit){
  int start = largestInt-(largestInt%n);
  List<int> multiples = [start];
  while(multiples.last < limit){
    multiples.add(multiples.last+n);
  }
  print(multiples.sublist(1));
  return multiples.sublist(1);
}