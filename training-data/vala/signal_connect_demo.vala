class Button : Object {
    public signal void clicked(int times);
    private int count = 0;

    public void press() {
        count++;
        clicked(count);
    }
}

void main() {
    var b = new Button();
    b.clicked.connect((times) => {
        stdout.printf("clicked %d time(s)\n", times);
    });
    b.press();
    b.press();
}
