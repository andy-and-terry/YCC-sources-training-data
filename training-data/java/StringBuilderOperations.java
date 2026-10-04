public class StringBuilderOperations {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder("hello world");
        sb.insert(0, ">> ").append('!').replace(3, 8, "HELLO");
        System.out.println(sb);
        sb.reverse();
        System.out.println(sb);
        sb.reverse().deleteCharAt(sb.length() - 1).setCharAt(0, '<');
        System.out.println(sb + " len=" + sb.length() + " idx=" + sb.indexOf("world"));
        sb.setLength(5);
        System.out.println("[" + sb + "]");

        String s1 = "java", s2 = new String("java");
        System.out.println((s1 == s2) + " " + s1.equals(s2) + " " + (s1 == s2.intern()));
        System.out.println("Mississippi".chars().filter(c -> c == 's').count());
    }
}
