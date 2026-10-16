class Node : Object {
    public string name;
    public weak Node? parent = null;
    public List<Node> children = new List<Node> ();

    public Node (string name) {
        this.name = name;
    }

    public void add_child (Node child) {
        child.parent = this;
        children.append (child);
    }

    public string path () {
        if (parent == null) {
            return name;
        }
        return parent.path () + "/" + name;
    }
}

void main () {
    var root = new Node ("root");
    var usr = new Node ("usr");
    var bin = new Node ("bin");
    root.add_child (usr);
    usr.add_child (bin);
    stdout.printf ("%s\n", bin.path ());
}
