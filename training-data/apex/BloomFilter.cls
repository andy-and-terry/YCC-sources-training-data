public class BloomFilter {
    private List<Boolean> bits;
    private Integer size;

    public BloomFilter(Integer size) {
        this.size = size;
        this.bits = new List<Boolean>();
        for (Integer i = 0; i < size; i++) {
            bits.add(false);
        }
    }

    private Integer hash1(String s) {
        Integer total = 0;
        for (Integer i = 0; i < s.length(); i++) {
            total += s.charAt(i);
        }
        return Math.mod(total, size);
    }

    private Integer hash2(String s) {
        Integer total = 7;
        for (Integer i = 0; i < s.length(); i++) {
            total = total * 31 + s.charAt(i);
        }
        return Math.mod(Math.abs(total), size);
    }

    public void add(String value) {
        bits[hash1(value)] = true;
        bits[hash2(value)] = true;
    }

    public Boolean mightContain(String value) {
        return bits[hash1(value)] && bits[hash2(value)];
    }

    public static void main() {
        BloomFilter filter = new BloomFilter(32);
        filter.add('apple');
        filter.add('banana');
        System.debug(filter.mightContain('apple'));
        System.debug(filter.mightContain('cherry'));
    }
}
