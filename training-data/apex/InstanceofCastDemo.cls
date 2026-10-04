public class InstanceofCastDemo {
    public virtual class Animal {
        public virtual String sound() { return '...'; }
    }

    public class Dog extends Animal {
        public override String sound() { return 'Woof'; }
        public String fetch() { return 'Fetching!'; }
    }

    public class Cat extends Animal {
        public override String sound() { return 'Meow'; }
    }

    public static void interact(Animal a) {
        System.debug(a.sound());
        if (a instanceof Dog) {
            Dog d = (Dog) a;
            System.debug(d.fetch());
        } else if (a instanceof Cat) {
            System.debug('Cats do not fetch');
        }
    }

    public static void main() {
        interact(new Dog());
        interact(new Cat());

        Object o = 'text';
        System.debug(o instanceof String);
        System.debug(o instanceof Integer);

        try {
            Object n = 42;
            String s = (String) n;
            System.debug(s);
        } catch (TypeException e) {
            System.debug('Bad cast: ' + e.getMessage());
        }

        SObject rec = new Account(Name = 'Test');
        System.debug(rec instanceof Account);
        Account acc = (Account) rec;
        System.debug(acc.Name);
    }
}
