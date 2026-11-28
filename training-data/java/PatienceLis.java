import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PatienceLis {
    public static void main(String[] args) {
        int[] a = {10, 9, 2, 5, 3, 7, 101, 18};
        List<Integer> tails = new ArrayList<>();
        for (int x : a) {
            int i = Collections.binarySearch(tails, x);
            if (i < 0) i = -i - 1;
            if (i == tails.size()) tails.add(x); else tails.set(i, x);
        }
        System.out.println(tails.size());
    }
}
