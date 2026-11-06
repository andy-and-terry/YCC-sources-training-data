// Bulls and Cows scoring for equal-length digit strings.
public class BullsAndCows {
    static int[] score(String secret, String guess) {
        int bulls = 0, cows = 0;
        int[] sc = new int[10], gc = new int[10];
        for (int i = 0; i < secret.length(); i++) {
            if (secret.charAt(i) == guess.charAt(i)) bulls++;
            else { sc[secret.charAt(i) - '0']++; gc[guess.charAt(i) - '0']++; }
        }
        for (int d = 0; d < 10; d++) cows += Math.min(sc[d], gc[d]);
        return new int[] {bulls, cows};
    }

    public static void main(String[] args) {
        int[] r = score("1807", "7810");
        System.out.println(r[0] + " bull(s), " + r[1] + " cow(s)");
    }
}
