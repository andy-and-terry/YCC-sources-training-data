public class Fletcher16Checksum {
    public static Integer fletcher16(Blob data) {
        Integer s1 = 0, s2 = 0;
        String hex = EncodingUtil.convertToHex(data);
        for (Integer i = 0; i < hex.length(); i += 2) {
            Integer b = hexByte(hex.substring(i, i + 2));
            s1 = Math.mod(s1 + b, 255);
            s2 = Math.mod(s2 + s1, 255);
        }
        return s2 * 256 + s1;
    }

    private static Integer hexByte(String h) {
        String digits = '0123456789abcdef';
        return digits.indexOf(h.substring(0, 1)) * 16 + digits.indexOf(h.substring(1, 2));
    }

    public static void demo() {
        System.debug(fletcher16(Blob.valueOf('abcde'))); // 51440
    }
}
