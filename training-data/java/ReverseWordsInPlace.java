public class ReverseWordsInPlace {
    static void reverse(char[] a, int i, int j) {
        while (i < j) {
            char t = a[i];
            a[i++] = a[j];
            a[j--] = t;
        }
    }

    static String reverseWords(String s) {
        char[] a = s.toCharArray();
        reverse(a, 0, a.length - 1);
        int start = 0;
        for (int i = 0; i <= a.length; i++) {
            if (i == a.length || a[i] == ' ') {
                reverse(a, start, i - 1);
                start = i + 1;
            }
        }
        return new String(a);
    }

    public static void main(String[] args) {
        System.out.println(reverseWords("the sky is blue"));
        System.out.println(reverseWords("single"));
    }
}
