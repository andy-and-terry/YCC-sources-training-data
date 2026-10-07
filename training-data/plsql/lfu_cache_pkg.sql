-- LFU cache as package-level state: parallel associative arrays for
-- values and access frequencies, evicting the least-frequently-used key.
CREATE OR REPLACE PACKAGE lfu_cache_pkg IS
    PROCEDURE init_cache(p_capacity IN NUMBER);
    PROCEDURE put_value(p_key IN NUMBER, p_value IN NUMBER);
    FUNCTION get_value(p_key IN NUMBER) RETURN NUMBER;
END lfu_cache_pkg;
/

CREATE OR REPLACE PACKAGE BODY lfu_cache_pkg IS
    TYPE value_map IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    values_map value_map;
    freq_map value_map;
    capacity NUMBER;
    key_count NUMBER;

    PROCEDURE init_cache(p_capacity IN NUMBER) IS
    BEGIN
        capacity := p_capacity;
        key_count := 0;
        values_map.DELETE;
        freq_map.DELETE;
    END init_cache;

    PROCEDURE evict_lfu IS
        min_key VARCHAR2(20);
        min_freq NUMBER := NULL;
        k VARCHAR2(20);
    BEGIN
        k := freq_map.FIRST;
        WHILE k IS NOT NULL LOOP
            IF min_freq IS NULL OR freq_map(k) < min_freq THEN
                min_freq := freq_map(k);
                min_key := k;
            END IF;
            k := freq_map.NEXT(k);
        END LOOP;
        values_map.DELETE(min_key);
        freq_map.DELETE(min_key);
        key_count := key_count - 1;
    END evict_lfu;

    PROCEDURE put_value(p_key IN NUMBER, p_value IN NUMBER) IS
        k VARCHAR2(20) := TO_CHAR(p_key);
    BEGIN
        IF capacity <= 0 THEN
            RETURN;
        END IF;
        IF values_map.EXISTS(k) THEN
            values_map(k) := p_value;
            freq_map(k) := freq_map(k) + 1;
            RETURN;
        END IF;
        IF key_count >= capacity THEN
            evict_lfu;
        END IF;
        values_map(k) := p_value;
        freq_map(k) := 1;
        key_count := key_count + 1;
    END put_value;

    FUNCTION get_value(p_key IN NUMBER) RETURN NUMBER IS
        k VARCHAR2(20) := TO_CHAR(p_key);
    BEGIN
        IF NOT values_map.EXISTS(k) THEN
            RETURN NULL;
        END IF;
        freq_map(k) := freq_map(k) + 1;
        RETURN values_map(k);
    END get_value;
END lfu_cache_pkg;
/

BEGIN
    lfu_cache_pkg.init_cache(2);
    lfu_cache_pkg.put_value(1, 10);
    lfu_cache_pkg.put_value(2, 20);
    DBMS_OUTPUT.PUT_LINE(lfu_cache_pkg.get_value(1));
    lfu_cache_pkg.put_value(3, 30);
    IF lfu_cache_pkg.get_value(2) IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('null');
    ELSE
        DBMS_OUTPUT.PUT_LINE(lfu_cache_pkg.get_value(2));
    END IF;
    DBMS_OUTPUT.PUT_LINE(lfu_cache_pkg.get_value(3));
END;
/
