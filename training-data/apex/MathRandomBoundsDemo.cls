public class MathRandomBoundsDemo {
    // Math.random() returns a Double in [0, 1)
    public static Integer randomBetween(Integer low, Integer high) {
        return low + (Integer) Math.floor(Math.random() * (high - low + 1));
    }

    public static void run() {
        Boolean allInRange = true;
        for (Integer i = 0; i < 100; i++) {
            Integer roll = randomBetween(1, 6);
            if (roll < 1 || roll > 6) {
                allInRange = false;
            }
        }
        System.debug('All 100 rolls within 1..6: ' + allInRange);

        // Crypto.getRandomInteger is the secure alternative
        Integer secure = Crypto.getRandomInteger();
        System.debug('Secure integer generated: ' + (secure != null));

        // Pick a random element from a list
        List<String> colors = new List<String>{ 'red', 'green', 'blue' };
        String pick = colors[randomBetween(0, colors.size() - 1)];
        System.debug('Picked a valid color: ' + colors.contains(pick));
    }
}
