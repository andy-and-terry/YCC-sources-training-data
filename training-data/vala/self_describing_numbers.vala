bool is_self_describing (string s) {
    for (int i = 0; i < s.length; i++) {
        int count = 0;
        for (int j = 0; j < s.length; j++) {
            if (s[j] == (char) ('0' + i)) {
                count++;
            }
        }
        if (count != s[i] - '0') {
            return false;
        }
    }
    return true;
}

void main () {
    string[] values = { "1210", "2020", "21200", "1211" };
    foreach (string s in values) {
        print ("%s %s\n", s, is_self_describing (s).to_string ());
    }
}
