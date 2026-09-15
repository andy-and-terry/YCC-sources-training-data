-- LRU cache as package-level state: a value map plus an order list that is
-- rebuilt on every touch to move the most-recently-used key to the tail.
CREATE OR REPLACE PACKAGE lru_cache_pkg IS
    PROCEDURE init_cache(p_capacity IN NUMBER);
    PROCEDURE put_value(p_key IN NUMBER, p_value IN NUMBER);
    FUNCTION get_value(p_key IN NUMBER) RETURN NUMBER;
END lru_cache_pkg;
/

CREATE OR REPLACE PACKAGE BODY lru_cache_pkg IS
    TYPE value_map IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    TYPE order_list IS TABLE OF NUMBER;
    cache_map value_map;
    order_arr order_list := order_list();
    capacity NUMBER;

    PROCEDURE touch_key(p_key IN NUMBER) IS
        new_order order_list := order_list();
    BEGIN
        FOR i IN 1..order_arr.COUNT LOOP
            IF order_arr(i) != p_key THEN
                new_order.EXTEND;
                new_order(new_order.COUNT) := order_arr(i);
            END IF;
        END LOOP;
        new_order.EXTEND;
        new_order(new_order.COUNT) := p_key;
        order_arr := new_order;
    END touch_key;

    PROCEDURE init_cache(p_capacity IN NUMBER) IS
    BEGIN
        capacity := p_capacity;
        cache_map.DELETE;
        order_arr := order_list();
    END init_cache;

    PROCEDURE put_value(p_key IN NUMBER, p_value IN NUMBER) IS
        evict_key NUMBER;
        new_order order_list := order_list();
    BEGIN
        cache_map(TO_CHAR(p_key)) := p_value;
        touch_key(p_key);
        IF order_arr.COUNT > capacity THEN
            evict_key := order_arr(1);
            cache_map.DELETE(TO_CHAR(evict_key));
            FOR i IN 2..order_arr.COUNT LOOP
                new_order.EXTEND;
                new_order(new_order.COUNT) := order_arr(i);
            END LOOP;
            order_arr := new_order;
        END IF;
    END put_value;

    FUNCTION get_value(p_key IN NUMBER) RETURN NUMBER IS
    BEGIN
        IF NOT cache_map.EXISTS(TO_CHAR(p_key)) THEN
            RETURN NULL;
        END IF;
        touch_key(p_key);
        RETURN cache_map(TO_CHAR(p_key));
    END get_value;
END lru_cache_pkg;
/

BEGIN
    lru_cache_pkg.init_cache(2);
    lru_cache_pkg.put_value(1, 1);
    lru_cache_pkg.put_value(2, 2);
    DBMS_OUTPUT.PUT_LINE(lru_cache_pkg.get_value(1));
    lru_cache_pkg.put_value(3, 3);
    IF lru_cache_pkg.get_value(2) IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('null');
    ELSE
        DBMS_OUTPUT.PUT_LINE(lru_cache_pkg.get_value(2));
    END IF;
END;
/
