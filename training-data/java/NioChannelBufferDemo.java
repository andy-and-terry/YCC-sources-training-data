import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

public class NioChannelBufferDemo {
    public static void main(String[] args) throws IOException {
        Path tempFile = Files.createTempFile("nio-channel", ".bin");
        try {
            byte[] payload = "channels and buffers".getBytes(StandardCharsets.UTF_8);

            try (var channel = Files.newByteChannel(tempFile, StandardOpenOption.WRITE)) {
                ByteBuffer writeBuffer = ByteBuffer.wrap(payload);
                while (writeBuffer.hasRemaining()) {
                    channel.write(writeBuffer);
                }
            }

            ByteBuffer readBuffer = ByteBuffer.allocate(64);
            try (var channel = Files.newByteChannel(tempFile, StandardOpenOption.READ)) {
                int bytesRead = channel.read(readBuffer);
                readBuffer.flip();
                byte[] data = new byte[bytesRead];
                readBuffer.get(data);
                System.out.println(new String(data, StandardCharsets.UTF_8));
            }

            ByteBuffer scratch = ByteBuffer.allocate(4);
            scratch.putInt(42);
            scratch.flip();
            System.out.println("decoded int: " + scratch.getInt());
        } finally {
            Files.deleteIfExists(tempFile);
        }
    }
}
