import java.io.*;

public class SerializationRoundTrip {
    static class P implements Serializable { String name = "ada"; transient String secret = "x"; int age = 36; }

    public static void main(String[] args) throws Exception {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try (ObjectOutputStream o = new ObjectOutputStream(bos)) { o.writeObject(new P()); }
        try (ObjectInputStream i = new ObjectInputStream(new ByteArrayInputStream(bos.toByteArray()))) {
            P p = (P) i.readObject();
            System.out.println(p.name + " " + p.age + " " + p.secret);
        }
    }
}
