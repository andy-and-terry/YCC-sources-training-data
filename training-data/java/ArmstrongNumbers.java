public class ArmstrongNumbers {
    static boolean isArmstrong(int n) {
        String s = String.valueOf(n);
        long sum = 0;
        for (char c : s.toCharArray()) sum += Math.round(Math.pow(c - '0', s.length()));
        return sum == n;
    }

    public static void main(String[] args) {
        for (int n = 1; n < 1000; n++) if (isArmstrong(n)) System.out.print(n + " ");
        System.out.println(); // 1..9 153 370 371 407
    }
}
