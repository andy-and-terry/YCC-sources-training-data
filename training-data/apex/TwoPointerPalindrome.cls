public class TwoPointerPalindrome {
    public static Boolean isPalindrome(String s) {
        Integer left = 0;
        Integer right = s.length() - 1;
        while (left < right) {
            while (left < right && !s.substring(left, left + 1).isAlphanumeric()) {
                left++;
            }
            while (left < right && !s.substring(right, right + 1).isAlphanumeric()) {
                right--;
            }
            if (s.substring(left, left + 1).toLowerCase() != s.substring(right, right + 1).toLowerCase()) {
                return false;
            }
            left++;
            right--;
        }
        return true;
    }

    public static void main() {
        System.debug(isPalindrome('A man, a plan, a canal: Panama'));
        System.debug(isPalindrome('Salesforce'));
    }
}
