public class PalindromeCheck {
    public static Boolean isPalindrome(String s) {
        String cleaned = s.toLowerCase().replaceAll('[^a-z0-9]', '');
        String reversed = cleaned.reverse();
        return cleaned == reversed;
    }

    public static void main() {
        System.debug(isPalindrome('A man, a plan, a canal: Panama'));
    }
}
