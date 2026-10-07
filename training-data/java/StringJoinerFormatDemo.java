import java.util.StringJoiner;

public class StringJoinerFormatDemo {
    public static void main(String[] args) {
        StringJoiner sj = new StringJoiner(", ", "[", "]");
        sj.setEmptyValue("EMPTY");
        System.out.println(sj);
        sj.add("a").add("b").add("c");
        System.out.println(sj);

        System.out.println(String.join("|", "x", "y", "z"));
        System.out.println(String.format("%-8s|%8.3f|%05d|%x", "name", Math.PI, 42, 255));
        System.out.println("  padded ".strip() + "|" + "ab".repeat(3) + "|" + " ".isBlank());
        System.out.println("a,b,,c,,".split(",").length + " " + "a,b,,c,,".split(",", -1).length);
    }
}
