class Node : Object {
    public string label;
    public unowned Node? parent = null;

    public Node (string label) {
        this.label = label;
    }

    ~Node () {
        print ("destroy %s\n", label);
    }
}

unowned string first_word (string text) {
    return text;
}

void main () {
    var root = new Node ("root");
    var child = new Node ("child");
    child.parent = root;

    print ("%s -> %s\n", child.label, child.parent.label);

    unowned string s = first_word ("borrowed");
    print ("%s\n", s);
}
