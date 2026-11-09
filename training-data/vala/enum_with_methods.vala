enum Color {
    RED, GREEN, BLUE;
    public string label () {
        switch (this) {
            case RED: return "red";
            case GREEN: return "green";
            default: return "blue";
        }
    }
}

void main () {
    print ("%s\n", Color.GREEN.label ());
}
