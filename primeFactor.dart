void main(){

  // https://www.youtube.com/watch?v=o35evzk02ug

  List<Set<int>> superset = [
    primeFactors(24),
    primeFactors(12),
    primeFactors(18),
    primeFactors(6),
  ];

  //print(superset);

  print(commonFactor(superset));

}

Set<int> primeFactors(int num){
  if(num == 1) return {1};
  int n = 2;
  Set<int> factors = {};
  while(n*n <= num){
    if( num % n == 0){
      factors.add(n);
      num = num ~/ n;
    }else{
      n++;
    }
  } 
  if(num > 1){
      factors.add(num);
  }
  return factors;
}

int commonFactor(List<Set<int>> superset){
  
  List<int> common = superset[0].toList();

  for(Set<int> set in superset){
    for(int num in superset[0]){
      if(!set.contains(num)){
        common.remove(num);
      }
    }
  }
  
  if(common.length >1){
    List commonInOrder = common.toList();
    commonInOrder.sort();
    return commonInOrder.last;
  }else if(common.length == 1){
    return common.toList()[0];
  }else{
    return 1;
  }
}