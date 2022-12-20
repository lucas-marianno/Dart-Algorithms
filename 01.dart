void main (){

  /*
  ↑ ↓ → ←
  
      A  →  C
      ↓     ↓ 
      B     E
      ↓
      D  →  F
      
  */

  String source = 'a';

  Map <String, List> graph = {
    'a': ['c', 'b'],
    'b': ['d'],
    'c': ['e'],
    'd': ['f'],
    'e': [],
    'f': [],
  };

  //print("depth ->   ${depthFirst(graph, source)}");
  //print("breadth -> ${breadthFirst(graph, source)}");
  depthFirstRecursive(graph, source);
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
    //print(source);
    path += source;
    graph[source]!.forEach((element) {
      deeper(graph, element);
    });  
  }

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