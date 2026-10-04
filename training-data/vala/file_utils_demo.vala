void main () {
    string path = Path.build_filename (Environment.get_tmp_dir (), "vala_file_demo.txt");

    try {
        FileUtils.set_contents (path, "alpha\nbeta\ngamma\n");

        string contents;
        FileUtils.get_contents (path, out contents);
        string[] lines = contents.strip ().split ("\n");
        print ("%d lines\n", lines.length);
        foreach (unowned string line in lines) {
            print ("- %s\n", line.up ());
        }

        print ("exists: %s\n", FileUtils.test (path, FileTest.EXISTS).to_string ());
        print ("basename: %s\n", Path.get_basename (path));

        FileUtils.remove (path);
        print ("exists after remove: %s\n", FileUtils.test (path, FileTest.EXISTS).to_string ());
    } catch (FileError e) {
        stderr.printf ("file error: %s\n", e.message);
    }
}
