CREATE OR REPLACE FUNCTION crc8(s IN VARCHAR2) RETURN PLS_INTEGER IS
    crc PLS_INTEGER := 0;
BEGIN
    FOR i IN 1 .. LENGTH(s) LOOP
        crc := BITAND(crc + ASCII(SUBSTR(s, i, 1)) - 2 * BITAND(crc, ASCII(SUBSTR(s, i, 1))), 255);
        FOR k IN 1 .. 8 LOOP
            IF BITAND(crc, 128) <> 0 THEN
                crc := BITAND(crc * 2, 255);
                crc := crc + 7 - 2 * BITAND(crc, 7);
            ELSE
                crc := BITAND(crc * 2, 255);
            END IF;
        END LOOP;
    END LOOP;
    RETURN crc;
END crc8;
/
