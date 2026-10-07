import java.util.StringJoiner;

public class StringJoinerAndFormat {
    public static void main(String[] args) {
        StringJoiner joiner = new StringJoiner(", ", "[", "]");
        joiner.setEmptyValue("EMPTY");
        System.out.println(joiner);
        joiner.add("one").add("two").add("three");
        System.out.println(joiner);

        System.out.println(String.join("-", "2024", "05", "17"));
        System.out.println(String.format("%-8s|%8s|", "left", "right"));
        System.out.println(String.format("%08.3f %,d %x", 3.14159, 1234567, 255));
        System.out.println("  padded ".strip() + "|" + "ab".repeat(3));
        System.out.println("a,b,,c".split(",").length);
    }
}
