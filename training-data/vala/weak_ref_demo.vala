class Child : Object {
    public weak Parent? parent;
    public string name;

    public Child(string name) {
        this.name = name;
    }
}

class Parent : Object {
    public string name;
    public Child? child;

    public Parent(string name) {
        this.name = name;
    }

    public void adopt(Child c) {
        child = c;
        c.parent = this;
    }
}

void main() {
    var parent = new Parent("root");
    var child = new Child("leaf");
    parent.adopt(child);

    stdout.printf("%s -> %s\n", parent.name, parent.child!.name);
    stdout.printf("%s -> %s\n", child.name, child.parent!.name);
}
