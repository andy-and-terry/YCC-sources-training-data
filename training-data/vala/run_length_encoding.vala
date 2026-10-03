string run_length_encode(string s) {
    if (s.length == 0) {
        return "";
    }
    var sb = new StringBuilder();
    char current = s[0];
    int count = 1;

    for (int i = 1; i < s.length; i++) {
        if (s[i] == current) {
            count++;
        } else {
            sb.append_c(current);
            sb.append(count.to_string());
            current = s[i];
            count = 1;
        }
    }
    sb.append_c(current);
    sb.append(count.to_string());
    return sb.str;
}

void main() {
    stdout.printf("%s\n", run_length_encode("aaabbbccd"));
    stdout.printf("%s\n", run_length_encode("wwwwaaadexxxxxx"));
}
