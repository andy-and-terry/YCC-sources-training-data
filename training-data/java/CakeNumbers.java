public class CakeNumbers {
    static int cake(int n) {
        return (n * n * n + 5 * n + 6) / 6;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 0; n < 10; n++) sb.append(cake(n)).append(' ');
        System.out.println(sb.toString().trim()); // 1 2 4 8 15 26 42 64 93 130
    }
}
