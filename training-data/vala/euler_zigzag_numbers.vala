// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
void main () {
    int64[] row = new int64[16];
    int64[] next = new int64[16];
    row[0] = 1;
    int len = 1;
    print ("1 ");
    for (int i = 0; i < 9; i++) {
        next[0] = 0;
        for (int j = 1; j <= len; j++) {
            next[j] = next[j - 1] + row[len - j];
        }
        len++;
        for (int j = 0; j < len; j++) row[j] = next[j];
        print ("%s ", row[len - 1].to_string ());
    }
    print ("\n");
}
