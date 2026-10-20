import java.nio.file.*;
import java.util.List;

public class NioFilesTempWalk {
    public static void main(String[] args) throws Exception {
        Path dir = Files.createTempDirectory("demo");
        Path f = dir.resolve("a.txt");
        Files.write(f, List.of("one", "two"));
        System.out.println(Files.readAllLines(f) + " " + Files.size(f));
        try (var s = Files.list(dir)) { System.out.println(s.count()); }
        Files.delete(f); Files.delete(dir);
        System.out.println(Files.exists(dir));
    }
}
