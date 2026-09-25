import java.util.Optional;

public class IsbnValidator {
    sealed interface Result permits Valid, Invalid {}
    record Valid(String kind, String normalized) implements Result {}
    record Invalid(String reason) implements Result {}

    public static Result validate(String raw) {
        String s = raw.replaceAll("[-\\s]", "").toUpperCase();
        return switch (s.length()) {
            case 10 -> {
                if (!s.matches("\\d{9}[\\dX]")) yield new Invalid("bad characters");
                int total = 0;
                for (int i = 0; i < 10; i++) total += (10 - i) * (s.charAt(i) == 'X' ? 10 : s.charAt(i) - '0');
                yield total % 11 == 0 ? new Valid("ISBN-10", s) : new Invalid("checksum");
            }
            case 13 -> {
                if (!s.matches("\\d{13}")) yield new Invalid("bad characters");
                int total = 0;
                for (int i = 0; i < 13; i++) total += (s.charAt(i) - '0') * (i % 2 == 0 ? 1 : 3);
                yield total % 10 == 0 ? new Valid("ISBN-13", s) : new Invalid("checksum");
            }
            default -> new Invalid("length " + s.length());
        };
    }

    public static Optional<String> toIsbn13(String isbn10) {
        if (!(validate(isbn10) instanceof Valid v) || !v.kind().equals("ISBN-10")) return Optional.empty();
        String core = "978" + v.normalized().substring(0, 9);
        int total = 0;
        for (int i = 0; i < 12; i++) total += (core.charAt(i) - '0') * (i % 2 == 0 ? 1 : 3);
        return Optional.of(core + (10 - total % 10) % 10);
    }

    public static void main(String[] args) {
        for (String s : new String[] {"0-306-40615-2", "0-306-40615-3", "978-0-306-40615-7", "12345"}) {
            System.out.println(s + " -> " + validate(s));
        }
        System.out.println(toIsbn13("0-306-40615-2").orElse("n/a"));
    }
}
