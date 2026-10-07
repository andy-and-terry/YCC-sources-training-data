import java.util.Arrays;

public class TriangleClassify {
    enum Kind { EQUILATERAL, ISOSCELES, SCALENE, INVALID }

    static Kind classify(double a, double b, double c) {
        double[] s = {a, b, c};
        Arrays.sort(s);
        if (s[0] <= 0 || s[0] + s[1] <= s[2]) return Kind.INVALID;
        if (s[0] == s[2]) return Kind.EQUILATERAL;
        if (s[0] == s[1] || s[1] == s[2]) return Kind.ISOSCELES;
        return Kind.SCALENE;
    }

    public static void main(String[] args) {
        System.out.println(classify(3, 3, 3) + " " + classify(3, 4, 4) + " " + classify(3, 4, 5) + " " + classify(1, 1, 3));
    }
}
