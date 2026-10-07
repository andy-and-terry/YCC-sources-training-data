int[] z_array(string s) {
    int n = s.length;
    int[] z = new int[n];
    int left = 0, right = 0;

    for (int i = 1; i < n; i++) {
        if (i < right) {
            z[i] = int.min(z[i - left], right - i);
        }
        while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
            z[i]++;
        }
        if (i + z[i] > right) {
            left = i;
            right = i + z[i];
        }
    }
    return z;
}

int[] z_search(string pattern, string text) {
    string combined = pattern + "\x01" + text;
    int[] z = z_array(combined);
    int plen = pattern.length;
    int[] matches = {};

    for (int i = 0; i < combined.length; i++) {
        if (z[i] == plen) {
            matches += (i - plen - 1);
        }
    }
    return matches;
}

void main() {
    int[] matches = z_search("aba", "abababa");
    foreach (int m in matches) {
        stdout.printf("%d ", m);
    }
    stdout.printf("\n");
}
