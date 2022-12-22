void main(){

  /*
  ← ↑ → ↓ ↖ ↗ ↘ ↙ - / \ |

  A  -  B
  ↑  ↙  | 
  C     D
  ↓
  E  -  F
  
   */

  Map<String,List> graph = {
    'a':['b'],
    'b':['a','c','d'],
    'c':['a','e'],
    'd':['b'],
    'e':['f'],
    'f':['e'],
  };

  String start = 'f';
  String finish = 'd';

  testAlgos(graph);
}

bool recursive(Map<String, List> graph, String start, String finish) {
  List visited =[start];//abcef - must be initialized with 'start'

  bool deeper(Map<String, List> graph, String start, String finish) {
    if (start == finish) {
      return true;
    }
    for (int i = 0; i < graph[start]!.length; i++) {
      if(visited.contains(graph[start]![i])){
        continue;
      }
      visited.add(graph[start]![i]);
      if (deeper(graph, graph[start]![i], finish) == true) {
        return true;
      }
    }
    return false;
  }
  return deeper(graph, start, finish);
}

bool depth(Map<String, List> graph, String start, String finish) {
  List stack = [start];

  while (stack.length > 0) {
    var current = stack.last;
    stack.removeLast();

    for (int i = 0; i < graph[current]!.length; i++) {
      if (graph[current]![i] == finish) {
        return true;
      }
      stack.add(graph[current]![i]);
    }
  }
  return false;
}

bool breadth(Map<String, List> graph, String start, String finish) {
  List queue = [start];

  while (queue.length > 0) {
    var current = queue[0];
    queue.removeAt(0);

    for (int i = 0; i < graph[current]!.length; i++) {
      if (graph[current]![i] == finish) {
        return true;
      }
      queue.add(graph[current]![i]);
    }
  }

  return false;
}

void testAlgos(Map<String, List> graph) {
  var nOfTests = 1;
  List nodesA = 'abcdef'.split('');
  List nodesB = 'abcdef'.split('');

  nodesA.forEach((a) {
    nodesB.forEach((b) {
      print('Test #$nOfTests');
      print('testing for $a and $b');
      
      print('recursive: ${recursive(graph, a, b)}');
      //print('depth:     ${depth(graph, a, b)}');
      //print('breadth:   ${breadth(graph, a, b)}');

      nOfTests++;
      if(nOfTests>=100){
        return;
      }
    });
  });
}
