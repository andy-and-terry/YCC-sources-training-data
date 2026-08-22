public class SimpleHashFunction {
    public static int djb2Hash(String s) {
        int h = 5381;
        for (char ch : s.toCharArray()) {
            h = ((h << 5) + h) + ch;
        }
        return h;
    }

    public static int fnv1aHash(String s) {
        int h = 0x811c9dc5;
        for (char ch : s.toCharArray()) {
            h ^= ch;
            h *= 0x01000193;
        }
        return h;
    }

    public static void main(String[] args) {
        System.out.println(djb2Hash("hello") + " " + fnv1aHash("hello"));
    }
}
