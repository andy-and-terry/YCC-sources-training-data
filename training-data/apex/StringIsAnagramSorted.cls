public class StringIsAnagramSorted {
    private static String sortChars(String s) {
        List<String> chars = s.toLowerCase().split('');
        chars.sort();
        return String.join(chars, '');
    }

    public static Boolean isAnagram(String a, String b) {
        return sortChars(a) == sortChars(b);
    }

    public static void main() {
        System.debug(isAnagram('Listen', 'Silent'));
        System.debug(isAnagram('apple', 'pale'));
    }
}
