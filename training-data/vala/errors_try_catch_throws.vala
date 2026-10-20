errordomain ParseError {
    EMPTY,
    BAD_NUMBER,
    NEGATIVE
}

int parse_positive (string s) throws ParseError {
    if (s == "") throw new ParseError.EMPTY ("empty input");
    int n;
    if (!int.try_parse (s, out n)) throw new ParseError.BAD_NUMBER ("not a number: %s", s);
    if (n < 0) throw new ParseError.NEGATIVE ("negative: %d", n);
    return n;
}

void main () {
    foreach (var s in new string[] {"42", "", "x1", "-3"}) {
        try {
            print ("ok %d\n", parse_positive (s));
        } catch (ParseError.EMPTY e) {
            print ("empty: %s\n", e.message);
        } catch (ParseError e) {
            print ("error %d: %s\n", e.code, e.message);
        } finally {
            print ("checked '%s'\n", s);
        }
    }
}
