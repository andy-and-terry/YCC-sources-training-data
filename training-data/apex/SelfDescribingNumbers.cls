public class SelfDescribingNumbers {
    public static Boolean isSelfDescribing(String s) {
        for (Integer i = 0; i < s.length(); i++) {
            Integer count = s.countMatches(String.valueOf(i));
            if (count != Integer.valueOf(s.substring(i, i + 1))) return false;
        }
        return true;
    }

    public static void main() {
        for (String s : new List<String>{'1210', '2020', '21200', '1211'}) {
            System.debug(s + ' ' + isSelfDescribing(s));
        }
    }
}
