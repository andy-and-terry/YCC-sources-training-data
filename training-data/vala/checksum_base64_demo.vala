void main() {
    string message = "The quick brown fox";

    // Hash digests via GLib.Checksum
    string md5 = Checksum.compute_for_string(ChecksumType.MD5, message);
    string sha = Checksum.compute_for_string(ChecksumType.SHA256, message);
    stdout.printf("md5:    %s\n", md5);
    stdout.printf("sha256: %s\n", sha.substring(0, 16) + "...");

    // Incremental hashing
    var cs = new Checksum(ChecksumType.SHA1);
    cs.update("The quick ".data, -1);
    cs.update("brown fox".data, -1);
    stdout.printf("sha1 length: %d hex chars\n", cs.get_string().length);

    // Base64 encode and decode
    string encoded = Base64.encode(message.data);
    stdout.printf("base64: %s\n", encoded);

    uchar[] decoded = Base64.decode(encoded);
    string roundtrip = (string) decoded;
    stdout.printf("decoded: %s\n", roundtrip);
    stdout.printf("roundtrip ok: %s\n", (roundtrip == message).to_string());
}
