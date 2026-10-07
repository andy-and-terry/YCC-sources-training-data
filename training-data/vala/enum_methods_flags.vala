enum Color {
    RED,
    GREEN,
    BLUE;

    public string label() {
        switch (this) {
            case RED: return "red";
            case GREEN: return "green";
            case BLUE: return "blue";
            default: return "?";
        }
    }

    public Color next() {
        return (Color) (((int) this + 1) % 3);
    }
}

[Flags]
enum Permission {
    READ,
    WRITE,
    EXEC
}

void main() {
    Color c = Color.BLUE;
    stdout.printf("%s -> %s\n", c.label(), c.next().label());

    Permission p = Permission.READ | Permission.WRITE;
    stdout.printf("can write: %s\n", (Permission.WRITE in p).to_string());
    stdout.printf("can exec: %s\n", (Permission.EXEC in p).to_string());
    p |= Permission.EXEC;
    p &= ~Permission.READ;
    stdout.printf("flags value: %d\n", (int) p);
}
