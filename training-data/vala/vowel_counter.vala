void main () {
    string text = "Education is beautiful".down ();
    string vowels = "aeiou";
    for (int v = 0; v < vowels.length; v++) {
        int n = 0;
        for (int i = 0; i < text.length; i++) {
            if (text[i] == vowels[v]) n++;
        }
        print ("%c=%d ", vowels[v], n);
    }
    print ("\n");
}
