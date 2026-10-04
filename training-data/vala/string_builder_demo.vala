void main () {
    var sb = new StringBuilder ();

    for (int i = 1; i <= 5; i++) {
        sb.append_printf ("%d^2=%d", i, i * i);
        if (i < 5) {
            sb.append (", ");
        }
    }
    print ("%s\n", sb.str);
    print ("length: %ld\n", sb.len);

    sb.prepend (">> ");
    sb.append_c ('!');
    sb.insert (3, "[squares] ");
    print ("%s\n", sb.str);

    sb.truncate (10);
    print ("%s\n", sb.str);
}
