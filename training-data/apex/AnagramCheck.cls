public class AnagramCheck {
    public static Boolean isAnagram(String a, String b) {
        List<String> aChars = a.split('');
        List<String> bChars = b.split('');
        aChars.sort();
        bChars.sort();
        return aChars == bChars;
    }

    public static void main() {
        System.debug(isAnagram('listen', 'silent'));
    }
}
