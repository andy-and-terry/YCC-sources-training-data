import java.util.OptionalInt;

public class SecondLargest {
    static OptionalInt find(int[] xs) {
        boolean haveFirst = false, haveSecond = false;
        int first = 0, second = 0;
        for (int x : xs) {
            if (!haveFirst || x > first) {
                if (haveFirst) { second = first; haveSecond = true; }
                first = x; haveFirst = true;
            } else if (x != first && (!haveSecond || x > second)) {
                second = x; haveSecond = true;
            }
        }
        return haveSecond ? OptionalInt.of(second) : OptionalInt.empty();
    }

    public static void main(String[] args) {
        System.out.println(find(new int[]{4, 9, 2, 9, 7}));
        System.out.println(find(new int[]{3, 3}));
    }
}
