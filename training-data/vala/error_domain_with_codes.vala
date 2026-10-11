errordomain ParseError {
    EMPTY,
    BAD_CHAR,
    OUT_OF_RANGE
}

int parse_percent (string s) throws ParseError {
    if (s.length == 0) {
        throw new ParseError.EMPTY ("input is empty");
    }
    int total = 0;
    for (int i = 0; i < s.length; i++) {
        char c = s[i];
        if (c < '0' || c > '9') {
            throw new ParseError.BAD_CHAR ("bad character '%c' at %d", c, i);
        }
        total = total * 10 + (c - '0');
    }
    if (total > 100) {
        throw new ParseError.OUT_OF_RANGE ("%d is above 100", total);
    }
    return total;
}

void main () {
    string[] inputs = { "42", "", "4x2", "250" };
    foreach (var s in inputs) {
        try {
            stdout.printf ("ok: %d\n", parse_percent (s));
        } catch (ParseError e) {
            stdout.printf ("error %d: %s\n", e.code, e.message);
        }
    }
}
