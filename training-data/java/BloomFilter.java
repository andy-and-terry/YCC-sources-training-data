import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.math.BigInteger;

public class BloomFilter {
    private final boolean[] bits;
    private final int size;
    private final int numHashes;

    public BloomFilter(int size, int numHashes) {
        this.size = size;
        this.numHashes = numHashes;
        this.bits = new boolean[size];
    }

    private int[] hashes(String item) {
        int[] result = new int[numHashes];
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            for (int i = 0; i < numHashes; i++) {
                digest.reset();
                byte[] hash = digest.digest((i + ":" + item).getBytes(StandardCharsets.UTF_8));
                BigInteger value = new BigInteger(1, hash);
                result[i] = value.mod(BigInteger.valueOf(size)).intValue();
            }
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public void add(String item) {
        for (int idx : hashes(item)) bits[idx] = true;
    }

    public boolean mightContain(String item) {
        for (int idx : hashes(item)) if (!bits[idx]) return false;
        return true;
    }

    public static void main(String[] args) {
        BloomFilter bf = new BloomFilter(1000, 3);
        bf.add("hello");
        System.out.println(bf.mightContain("hello") + " " + bf.mightContain("world"));
    }
}
