import java.util.regex.*;

public class RegexMatcherGroups {
    public static void main(String[] args) {
        Matcher m = Pattern.compile("(?<k>\\w+)=(?<v>\\d+)").matcher("a=1, bb=22, c=x");
        while (m.find()) System.out.println(m.group("k") + " -> " + m.group("v"));
        System.out.println("2024-01-02".replaceAll("(\\d+)-(\\d+)-(\\d+)", "$3.$2.$1"));
        System.out.println(Pattern.matches("[a-z]+\\d?", "abc1"));
    }
}
