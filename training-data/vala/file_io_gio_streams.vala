void main () {
    try {
        var file = File.new_for_path (Environment.get_tmp_dir () + "/vala_demo.txt");
        {
            var os = new DataOutputStream (file.replace (null, false, FileCreateFlags.NONE));
            os.put_string ("line one\n");
            os.put_string ("line two\n");
        }
        var dis = new DataInputStream (file.read ());
        string? line;
        int n = 0;
        while ((line = dis.read_line (null)) != null) { n++; print ("%d: %s\n", n, line); }
        FileInfo info = file.query_info ("standard::size", FileQueryInfoFlags.NONE);
        print ("size %" + int64.FORMAT + "\n", info.get_size ());
        string contents;
        FileUtils.get_contents (file.get_path (), out contents);
        print ("%d chars\n", contents.length);
        print ("%s\n", file.query_exists ().to_string ());
        file.delete ();
        print ("%s\n", file.query_exists ().to_string ());
    } catch (Error e) {
        stderr.printf ("error: %s\n", e.message);
    }
}
