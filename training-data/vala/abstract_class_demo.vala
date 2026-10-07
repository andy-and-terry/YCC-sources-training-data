abstract class Animal : Object {
    public string name;

    protected Animal(string name) {
        this.name = name;
    }

    public abstract string speak();

    public virtual string describe() {
        return "%s says %s".printf(name, speak());
    }
}

class Dog : Animal {
    public Dog(string name) {
        base(name);
    }

    public override string speak() {
        return "Woof";
    }
}

class Cat : Animal {
    public Cat(string name) {
        base(name);
    }

    public override string speak() {
        return "Meow";
    }

    public override string describe() {
        return "%s (a cat) says %s".printf(name, speak());
    }
}

void main() {
    Animal[] animals = { new Dog("Rex"), new Cat("Whiskers") };
    foreach (Animal a in animals) {
        stdout.printf("%s\n", a.describe());
    }
}
