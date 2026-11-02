public class StringBuilderReverseInsertX2 {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder("hello");
        sb.insert(0, ">> ").append('!').reverse();
        System.out.println(sb);
    }
}
