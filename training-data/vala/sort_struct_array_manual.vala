struct Person {
    public string name;
    public int age;
}

void sort_by_age (Person[] people) {
    for (int i = 0; i < people.length - 1; i++) {
        for (int j = 0; j < people.length - 1 - i; j++) {
            if (people[j].age > people[j + 1].age) {
                Person tmp = people[j];
                people[j] = people[j + 1];
                people[j + 1] = tmp;
            }
        }
    }
}

void main () {
    Person[] people = {
        Person () { name = "Mia", age = 31 },
        Person () { name = "Joe", age = 25 },
        Person () { name = "Ann", age = 40 }
    };
    sort_by_age (people);
    foreach (var p in people) {
        stdout.printf ("%s (%d)\n", p.name, p.age);
    }
}
