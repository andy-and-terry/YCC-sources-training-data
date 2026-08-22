public class ReverseString {
    public static String reverse(String s) {
        return new StringBuilder(s).reverse().toString();
    }

    public static String reverseWords(String s) {
        String[] words = s.split(" ");
        StringBuilder sb = new StringBuilder();
        for (int i = words.length - 1; i >= 0; i--) {
            sb.append(words[i]);
            if (i > 0) sb.append(" ");
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(reverse("hello"));
        System.out.println(reverseWords("the quick brown fox"));
    }
}
