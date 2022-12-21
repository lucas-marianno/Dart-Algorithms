void main (){

  /*

    Graph 1
  
      A  →  C
      ↓     ↓ 
      B     E
      ↓
      D  →  F
      
  */

  String source = 'a';

  Map <String, List> graph1 = {
    'a': ['b', 'c'],
    'b': ['d'],
    'c': ['e'],
    'd': ['f'],
    'e': [],
    'f': [],
  };

/*

    Graph 2
  
      A  →  B
      ↓     ↓ 
      C     D
      ↓
      E  →  F
      
  */


  Map <String, List> graph2 = {
    'a': ['b', 'c'],
    'b': ['d'],
    'c': ['e'],
    'd': [],
    'e': ['f'],
    'f': [],
  };

  print("depth          ->   ${depthFirst(graph2, source)}");
  print("breadth        ->   ${breadthFirst(graph2, source)}");
  print("dpth recursive ->   ${depthFirstRecursive(graph2, source)}");
}

String depthFirst(Map <String, List> graph, source){
  
  // source is the first node to be checked and where the search will start
  List stack = [source];

  // path will be filled with the nodes in order of search
  String path = '';

  // the search will be finished when the stack is empty
  while(stack.length >0){
    
    // saves the last added element to stack as the search for the next iteration
    var current = stack.last; 
    
    /// the depthFirst algorithm implies that the search must go as deep as
    /// possible before movig to the next branch. Therefore, it will always
    /// continue from the top of stack (last added element).
    stack.removeLast();

    // saves the current node to the path
    path += current;
    
    // goes through each possible new branch saving them to the stack.
    graph[current]!.forEach((element) {
      stack.add(element);
    });
  }

  return path;
}

String depthFirstRecursive(Map <String, List> graph, source){

  String path = '';
  void deeper(Map <String, List> graph, source){

    path += source;
    graph[source]!.forEach((element) {
      deeper(graph, element);
    });  
  }

  deeper(graph, source);

  return path;
}


String breadthFirst(Map <String, List> graph, source){
  
  /// the only difference between the algos is that one works with the ideia of
  /// a queue and the other with the idea of a stack.
  /// queue = first added element goes next.
  /// stack = last added element goes next.

  List queue = [source];

  String path = '';

  while(queue.length >0){
    
    var current = queue[0];

    /// the breadthFirst algorithm implies that the search explores all possible
    /// branches before going deeper. Therefore, it will always continue from
    /// the first added element to the queue.
    queue.removeAt(0);
    path += current;
    
    graph[current]!.forEach((element) {
      queue.add(element);
    });
  }

  return path;
}