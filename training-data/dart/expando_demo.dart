class Node {
  final String name;
  Node(this.name);
}

void main() {
  final notes = Expando<String>('notes');
  final a = Node('a');
  final b = Node('b');

  notes[a] = 'first node';
  print(notes[a]);
  print(notes[b]);

  notes[b] = 'second node';
  print(notes[b]);

  notes[a] = null;
  print(notes[a]);
}
