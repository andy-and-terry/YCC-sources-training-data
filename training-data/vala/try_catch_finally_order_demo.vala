errordomain ParseError {
    EMPTY,
    BAD_NUMBER
}

int parse_positive (string s) throws ParseError {
    if (s == "") {
        throw new ParseError.EMPTY ("empty input");
    }
    int v;
    if (!int.try_parse (s, out v) || v < 0) {
        throw new ParseError.BAD_NUMBER ("not a positive number: %s", s);
    }
    return v;
}

void attempt (string input) {
    try {
        int v = parse_positive (input);
        stdout.printf ("parsed %d\n", v);
    } catch (ParseError.EMPTY e) {
        stdout.printf ("empty: %s\n", e.message);
    } catch (ParseError e) {
        stdout.printf ("other: %s\n", e.message);
    } finally {
        stdout.printf ("finished '%s'\n", input);
    }
}

void main () {
    attempt ("42");
    attempt ("");
    attempt ("-7");
    attempt ("abc");
}
