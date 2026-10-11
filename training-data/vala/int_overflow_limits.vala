void main () {
    stdout.printf ("int8:   %d .. %d\n", int8.MIN, int8.MAX);
    stdout.printf ("uint8:  %u .. %u\n", uint8.MIN, uint8.MAX);
    stdout.printf ("int16:  %d .. %d\n", int16.MIN, int16.MAX);
    stdout.printf ("int32:  %d .. %d\n", int.MIN, int.MAX);
    stdout.printf ("uint32: %u\n", uint.MAX);
    stdout.printf ("int64:  %" + int64.FORMAT + "\n", int64.MAX);

    uint8 b = 250;
    b += 10;
    stdout.printf ("250 + 10 as uint8 = %u\n", b);
}
