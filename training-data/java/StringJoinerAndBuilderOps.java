import java.util.StringJoiner;

public class StringJoinerAndBuilderOps {
    public static void main(String[] args) {
        StringJoiner j = new StringJoiner(", ", "[", "]");
        j.add("a").add("b").add("c");
        System.out.println(j);
        StringBuilder sb = new StringBuilder("hello");
        sb.insert(0, ">> ").reverse().setCharAt(0, 'O');
        System.out.println(sb);
    }
}
