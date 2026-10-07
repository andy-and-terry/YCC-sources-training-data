import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

public class NioFileDemo {
    public static void main(String[] args) throws IOException {
        Path tempFile = Files.createTempFile("nio-demo", ".txt");
        try {
            List<String> lines = List.of("first line", "second line", "third line");
            Files.write(tempFile, lines, StandardCharsets.UTF_8);

            List<String> readBack = Files.readAllLines(tempFile);
            System.out.println(readBack);

            System.out.println("size in bytes: " + Files.size(tempFile));
            System.out.println("exists: " + Files.exists(tempFile));

            Path renamed = tempFile.resolveSibling("nio-demo-renamed.txt");
            Files.move(tempFile, renamed, java.nio.file.StandardCopyOption.REPLACE_EXISTING);

            long matchingLines = Files.lines(renamed)
                .filter(line -> line.contains("line"))
                .count();
            System.out.println("matching lines: " + matchingLines);

            Files.deleteIfExists(renamed);
        } finally {
            Files.deleteIfExists(tempFile);
        }
    }
}
