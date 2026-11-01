enum Color { RED, GREEN, BLUE }

string name (Color c) {
    switch (c) {
        case Color.RED: return "red";
        case Color.GREEN: return "green";
        default: return "blue";
    }
}

void main () {
    foreach (var c in new Color[] { Color.RED, Color.BLUE })
        print ("%s\n", name (c));
}
