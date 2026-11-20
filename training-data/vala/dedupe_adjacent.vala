// Remove consecutive duplicate characters.
string dedupe (string s) {
    var sb = new StringBuilder ();
    for (int i = 0; i < s.length; i++)
        if (i == 0 || s[i] != s[i - 1]) sb.append_c (s[i]);
    return sb.str;
}

void main () {
    print ("%s\n", dedupe ("aabbbcdd"));
}
