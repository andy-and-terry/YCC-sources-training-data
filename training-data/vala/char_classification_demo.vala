void main () {
    string input = "Hello World 2024! #vala";
    int letters = 0, digits = 0, spaces = 0, upper = 0, other = 0;

    for (int i = 0; i < input.length; i++) {
        char c = input[i];
        if (c.isalpha ()) {
            letters++;
            if (c.isupper ()) {
                upper++;
            }
        } else if (c.isdigit ()) {
            digits++;
        } else if (c.isspace ()) {
            spaces++;
        } else {
            other++;
        }
    }
    stdout.printf ("letters=%d upper=%d digits=%d spaces=%d other=%d\n",
                   letters, upper, digits, spaces, other);
}
