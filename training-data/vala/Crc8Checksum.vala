uint8 crc8 (uint8[] data) {
    uint8 crc = 0;
    foreach (uint8 b in data) {
        crc ^= b;
        for (int i = 0; i < 8; i++) {
            crc = (crc & 0x80) != 0 ? (uint8) ((crc << 1) ^ 0x07) : (uint8) (crc << 1);
        }
    }
    return crc;
}

void main () {
    print ("%02x\n", crc8 ("123456789".data));
}
