errordomain MyError { BAD_INPUT }

void check (int n) throws MyError {
    if (n < 0) throw new MyError.BAD_INPUT ("negative");
}

void main () {
    try { check (-1); } catch (MyError e) { print ("caught: %s\n", e.message); }
}
