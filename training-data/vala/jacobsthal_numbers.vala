// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
void main () {
    int a = 0;
    int b = 1;
    var sb = new StringBuilder ();
    for (int i = 0; i < 15; i++) {
        sb.append (@"$a ");
        int next = b + 2 * a;
        a = b;
        b = next;
    }
    print ("%s\n", sb.str.strip ());
}
