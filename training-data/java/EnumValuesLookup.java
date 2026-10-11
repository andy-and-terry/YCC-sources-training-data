import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

public class EnumValuesLookup {
    enum HttpStatus {
        OK(200), NOT_FOUND(404), SERVER_ERROR(500);

        private static final Map<Integer, HttpStatus> BY_CODE = Arrays.stream(values())
                .collect(Collectors.toMap(s -> s.code, Function.identity()));
        final int code;

        HttpStatus(int code) {
            this.code = code;
        }

        static HttpStatus fromCode(int code) {
            HttpStatus s = BY_CODE.get(code);
            if (s == null) throw new IllegalArgumentException("unknown code " + code);
            return s;
        }
    }

    public static void main(String[] args) {
        System.out.println(HttpStatus.fromCode(404));
        System.out.println(HttpStatus.valueOf("OK").code);
        System.out.println(HttpStatus.SERVER_ERROR.ordinal());
        try {
            HttpStatus.fromCode(418);
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }
    }
}
