class Person {
  final String name;
  final int age;
  const Person(this.name, this.age);

  @override
  String toString() => '$name($age)';
}

void main() {
  final people = [
    Person('Cara', 31),
    Person('Alex', 25),
    Person('Bao', 31),
    Person('Dina', 19),
  ];

  people.sort((a, b) => a.age.compareTo(b.age));
  print(people);

  people.sort((a, b) {
    final byAge = b.age.compareTo(a.age);
    return byAge != 0 ? byAge : a.name.compareTo(b.name);
  });
  print(people);

  final names = people.map((p) => p.name).toList()..sort();
  print(names);

  final words = ['banana', 'fig', 'cherry', 'kiwi'];
  words.sort((a, b) => a.length.compareTo(b.length));
  print(words);
  print(words.reversed.toList());
  words.shuffle();
  print(words.length);
}
