class Box<T> : Object {
    T value;

    public Box(T v) {
        value = v;
    }

    public T get_value() {
        return value;
    }
}

void main() {
    var intBox = new Box<int>(42);
    stdout.printf("%d\n", intBox.get_value());

    var strBox = new Box<string>("hello");
    stdout.printf("%s\n", strBox.get_value());
}
