CREATE OR REPLACE PACKAGE lru_cache_pkg IS
    PROCEDURE init(p_capacity IN NUMBER);
    PROCEDURE put(p_key IN NUMBER, p_value IN VARCHAR2);
    FUNCTION get(p_key IN NUMBER) RETURN VARCHAR2;
    PROCEDURE print_order;
END lru_cache_pkg;
/

CREATE OR REPLACE PACKAGE BODY lru_cache_pkg IS
    TYPE value_map IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
    TYPE key_list IS TABLE OF NUMBER;

    g_values value_map;
    g_order  key_list := key_list();
    g_capacity NUMBER := 0;

    PROCEDURE remove_key(p_key IN NUMBER) IS
        v_new key_list := key_list();
    BEGIN
        FOR i IN 1..g_order.COUNT LOOP
            IF g_order(i) != p_key THEN
                v_new.EXTEND;
                v_new(v_new.COUNT) := g_order(i);
            END IF;
        END LOOP;
        g_order := v_new;
    END remove_key;

    PROCEDURE touch(p_key IN NUMBER) IS
    BEGIN
        remove_key(p_key);
        g_order.EXTEND;
        g_order(g_order.COUNT) := p_key;
    END touch;

    PROCEDURE init(p_capacity IN NUMBER) IS
    BEGIN
        g_capacity := p_capacity;
        g_order := key_list();
        g_values.DELETE;
    END init;

    PROCEDURE put(p_key IN NUMBER, p_value IN VARCHAR2) IS
        v_oldest NUMBER;
    BEGIN
        IF g_values.EXISTS(p_key) THEN
            g_values(p_key) := p_value;
            touch(p_key);
            RETURN;
        END IF;

        IF g_order.COUNT >= g_capacity THEN
            v_oldest := g_order(1);
            g_values.DELETE(v_oldest);
            remove_key(v_oldest);
        END IF;

        g_values(p_key) := p_value;
        touch(p_key);
    END put;

    FUNCTION get(p_key IN NUMBER) RETURN VARCHAR2 IS
    BEGIN
        IF NOT g_values.EXISTS(p_key) THEN
            RETURN NULL;
        END IF;
        touch(p_key);
        RETURN g_values(p_key);
    END get;

    PROCEDURE print_order IS
    BEGIN
        FOR i IN 1..g_order.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(g_order(i) || ' => ' || g_values(g_order(i)));
        END LOOP;
    END print_order;
END lru_cache_pkg;
/

CREATE OR REPLACE PROCEDURE run_lru_cache_demo IS
BEGIN
    lru_cache_pkg.init(2);
    lru_cache_pkg.put(1, 'a');
    lru_cache_pkg.put(2, 'b');
    DBMS_OUTPUT.PUT_LINE(lru_cache_pkg.get(1));
    lru_cache_pkg.put(3, 'c');
    lru_cache_pkg.print_order;
END run_lru_cache_demo;
/
