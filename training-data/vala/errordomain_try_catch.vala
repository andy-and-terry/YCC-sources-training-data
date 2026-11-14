errordomain MyError { BAD_INPUT }

int parse (string s) throws MyError {
    int n = 0;
    if (!int.try_parse (s, out n)) throw new MyError.BAD_INPUT ("bad: %s", s);
    return n;
}

void main () {
    try { print ("%d\n", parse ("12")); parse ("x"); }
    catch (MyError e) { print ("caught %s\n", e.message); }
}
