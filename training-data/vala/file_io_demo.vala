void main() {
    string path = Path.build_filename(Environment.get_tmp_dir(), "vala_io_demo.txt");

    try {
        FileUtils.set_contents(path, "line one\nline two\nline three\n");

        string contents;
        FileUtils.get_contents(path, out contents);
        stdout.printf("read %d bytes\n", contents.length);

        var file = File.new_for_path(path);
        var stream = new DataInputStream(file.read());
        string? line;
        int n = 0;
        while ((line = stream.read_line()) != null) {
            n++;
            stdout.printf("%d: %s\n", n, line);
        }

        file.delete();
        stdout.printf("exists after delete: %s\n", file.query_exists().to_string());
    } catch (Error e) {
        stderr.printf("error: %s\n", e.message);
    }
}
