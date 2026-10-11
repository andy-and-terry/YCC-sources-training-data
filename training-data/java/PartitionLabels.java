import java.util.ArrayList;
import java.util.List;

public class PartitionLabels {
    static List<Integer> partition(String s) {
        int[] last = new int[26];
        for (int i = 0; i < s.length(); i++) last[s.charAt(i) - 'a'] = i;
        List<Integer> sizes = new ArrayList<>();
        int start = 0, end = 0;
        for (int i = 0; i < s.length(); i++) {
            end = Math.max(end, last[s.charAt(i) - 'a']);
            if (i == end) {
                sizes.add(end - start + 1);
                start = i + 1;
            }
        }
        return sizes;
    }

    public static void main(String[] args) {
        System.out.println(partition("ababcbacadefegdehijhklij"));
        System.out.println(partition("eccbbbbdec"));
    }
}
