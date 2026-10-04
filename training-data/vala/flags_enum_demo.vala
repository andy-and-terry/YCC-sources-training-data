[Flags]
enum Permission {
    READ,
    WRITE,
    EXECUTE;

    public string describe () {
        var parts = new string[0];
        if (Permission.READ in this) {
            parts += "read";
        }
        if (Permission.WRITE in this) {
            parts += "write";
        }
        if (Permission.EXECUTE in this) {
            parts += "execute";
        }
        return parts.length == 0 ? "none" : string.joinv (",", parts);
    }
}

void main () {
    Permission p = Permission.READ | Permission.WRITE;
    print ("%s\n", p.describe ());

    p |= Permission.EXECUTE;
    print ("%s\n", p.describe ());

    p &= ~Permission.WRITE;
    print ("%s\n", p.describe ());

    print ("can write: %s\n", (Permission.WRITE in p).to_string ());
    print ("none: %s\n", ((Permission) 0).describe ());
}
