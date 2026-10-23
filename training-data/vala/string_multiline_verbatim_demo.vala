// Verbatim strings """...""" keep newlines and do not process escapes.
void main () {
    string poem = """Roses are red,
Violets are blue,\n stays literal here.""";
    stdout.printf ("%s\n", poem);

    string[] lines = poem.split ("\n");
    stdout.printf ("line count: %d\n", lines.length);

    string path = """C:\temp\new""";
    stdout.printf ("%s (%d chars)\n", path, path.length);

    // Adjacent regular strings need escapes.
    string escaped = "tab:\there, quote:\" done";
    stdout.printf ("%s\n", escaped);

    // Strings may be sliced with [start:end].
    string word = "vala-language";
    stdout.printf ("%s\n", word[0:4]);
    stdout.printf ("%s\n", word[5:word.length]);
}
