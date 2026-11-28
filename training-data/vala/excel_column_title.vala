string column_title (int n) {
    var sb = new StringBuilder ();
    while (n > 0) {
        n--;
        sb.prepend_c ((char) ('A' + n % 26));
        n /= 26;
    }
    return sb.str;
}

void main () {
    print ("%s %s\n", column_title (28), column_title (701)); // AB ZY
}
