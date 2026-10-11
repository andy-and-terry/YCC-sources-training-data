class Resource : Object {
    private string label;

    public Resource (string label) {
        this.label = label;
        stdout.printf ("acquire %s\n", label);
    }

    ~Resource () {
        stdout.printf ("release %s\n", label);
    }
}

void use_scope () {
    var inner = new Resource ("inner");
    stdout.printf ("using %s scope\n", "inner");
}

void main () {
    var outer = new Resource ("outer");
    use_scope ();
    stdout.printf ("back in main\n");
    outer = null;
    stdout.printf ("done\n");
}
