String greet(String name, {String greeting = 'Hello', String punctuation = '!'}) {
  return '$greeting, $name$punctuation';
}

void main() {
  print(greet('Ada'));
  print(greet('Bob', greeting: 'Hi', punctuation: '?'));
}
