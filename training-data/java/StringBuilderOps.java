public class StringBuilderOps {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder("hello world");
        sb.insert(0, ">> ").append('!').reverse().reverse();
        sb.replace(3, 8, "HELLO").deleteCharAt(sb.length() - 1);
        System.out.println(sb + " len=" + sb.length());
        System.out.println(String.join("|", "a", "b", "c") + " " + "ab".repeat(3));
    }
}
