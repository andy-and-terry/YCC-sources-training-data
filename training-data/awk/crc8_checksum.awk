function xor8(a, b,    r, bit, i) {
    r = 0
    for (i = 0; i < 8; i++) {
        bit = 2 ^ i
        if ((int(a / bit) % 2) != (int(b / bit) % 2)) r += bit
    }
    return r
}
BEGIN {
    s = "123456789"; crc = 0
    for (i = 1; i <= length(s); i++) {
        crc = xor8(crc, ord(substr(s, i, 1)))
        for (k = 0; k < 8; k++) {
            if (crc >= 128) crc = xor8((crc * 2) % 256, 7)
            else crc = (crc * 2) % 256
        }
    }
    printf "%02x\n", crc
}
function ord(c,    i) { for (i = 0; i < 256; i++) if (sprintf("%c", i) == c) return i }
