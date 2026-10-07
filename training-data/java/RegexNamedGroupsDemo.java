import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexNamedGroupsDemo {
    public static void main(String[] args) {
        Pattern p = Pattern.compile("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})");
        Matcher m = p.matcher("Released on 2023-09-14, patched 2024-01-05.");
        while (m.find()) {
            System.out.printf("year=%s month=%s day=%s%n",
                m.group("year"), m.group("month"), m.group("day"));
        }

        String swapped = p.matcher("2023-09-14").replaceAll("${day}/${month}/${year}");
        System.out.println(swapped);

        Pattern email = Pattern.compile("^[\\w.+-]+@[\\w-]+\\.[a-z]{2,}$", Pattern.CASE_INSENSITIVE);
        for (String s : new String[] {"bob@example.com", "bad@", "ALICE@Mail.ORG"}) {
            System.out.println(s + " -> " + email.matcher(s).matches());
        }
    }
}
