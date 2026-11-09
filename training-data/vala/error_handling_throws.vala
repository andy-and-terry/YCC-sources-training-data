errordomain MyError { BAD_INPUT }

int parse (string s) throws MyError {
    int v;
    if (!int.try_parse (s, out v)) throw new MyError.BAD_INPUT ("not a number: %s", s);
    return v;
}

void main () {
    try {
        print ("%d\n", parse ("42"));
        parse ("x");
    } catch (MyError e) {
        print ("caught: %s\n", e.message);
    }
}
