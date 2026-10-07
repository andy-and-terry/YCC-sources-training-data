public class CryptoHashDemo {
    public static String sha256Hex(String input) {
        Blob digest = Crypto.generateDigest('SHA-256', Blob.valueOf(input));
        return EncodingUtil.convertToHex(digest);
    }

    public static String hmacSha256(String message, String secret) {
        Blob mac = Crypto.generateMac('HmacSHA256', Blob.valueOf(message), Blob.valueOf(secret));
        return EncodingUtil.base64Encode(mac);
    }

    public static void main() {
        System.debug(sha256Hex('hello'));
        System.debug(sha256Hex('hello') == sha256Hex('hello'));
        System.debug(sha256Hex('hello') == sha256Hex('Hello'));

        System.debug(hmacSha256('payload', 'topsecret'));

        Blob md5 = Crypto.generateDigest('MD5', Blob.valueOf('hello'));
        System.debug(EncodingUtil.convertToHex(md5));

        Integer rnd = Math.abs(Crypto.getRandomInteger());
        System.debug(rnd >= 0);

        // Random key and AES round trip
        Blob key = Crypto.generateAesKey(128);
        Blob encrypted = Crypto.encryptWithManagedIV('AES128', key, Blob.valueOf('secret data'));
        Blob decrypted = Crypto.decryptWithManagedIV('AES128', key, encrypted);
        System.debug(decrypted.toString());
    }
}
