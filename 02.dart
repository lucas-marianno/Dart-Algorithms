void main() {
  /*
  ←↑→↓↖↗↘↙
  
  F  →  G  →  H
  ↓  ↗
  I  ←  J     
  ↓
  K


  Write a function that returns if the path from 'x' to 'y' is possible or not
  You can use either depth, breadth ou recursive depth to achieve the result
  
  */
  Map<String, List> graph = {
    'f': ['g', 'i'],
    'g': ['h'],
    'h': [],
    'i': ['g', 'k'],
    'j': ['i'],
    'k': [],
  };

  String start = 'f';
  String finish = 'i';

  print(depth(graph, start, finish));
  print(recursive(graph, start, finish));
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

bool recursive(Map<String, List> graph, String start, String finish) {
  if (start == finish) {
    return true;
  }
  for (int i = 0; i < graph[start]!.length; i++) {
    if (recursive(graph, graph[start]![i], finish) == true) {
      return true;
    }
  }
  return false;
}
