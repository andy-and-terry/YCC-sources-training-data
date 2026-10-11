string reverse_words (string sentence) {
    string[] words = sentence.split (" ");
    var sb = new StringBuilder ();
    for (int i = words.length - 1; i >= 0; i--) {
        if (words[i] == "") {
            continue;
        }
        if (sb.len > 0) {
            sb.append_c (' ');
        }
        sb.append (words[i]);
    }
    return sb.str;
}

void main () {
    stdout.printf ("%s\n", reverse_words ("the quick brown fox"));
    stdout.printf ("%s\n", reverse_words ("  spaced   out  "));
}
