public class EncodingUtilDemo {
    public static String toBase64(String text) {
        return EncodingUtil.base64Encode(Blob.valueOf(text));
    }

    public static String fromBase64(String encoded) {
        return EncodingUtil.base64Decode(encoded).toString();
    }

    public static void main() {
        String original = 'Apex rocks!';
        String enc = toBase64(original);
        System.debug(enc);                       // QXBleCByb2NrcyE=
        System.debug(fromBase64(enc));

        String url = 'name=John Smith&city=San Jose';
        String urlEnc = EncodingUtil.urlEncode(url, 'UTF-8');
        System.debug(urlEnc);
        System.debug(EncodingUtil.urlDecode(urlEnc, 'UTF-8'));

        Blob b = Blob.valueOf('abc');
        System.debug(EncodingUtil.convertToHex(b));  // 616263
        System.debug(b.size());

        String b64 = EncodingUtil.base64Encode(Blob.valueOf('Basic auth: user:pass'));
        System.debug('Authorization: Basic ' + b64);
    }
}
