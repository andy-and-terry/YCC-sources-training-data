DECLARE
    TYPE str_map IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    TYPE num_list IS VARRAY(5) OF NUMBER;
    TYPE nested IS TABLE OF VARCHAR2(10);
    m str_map;
    v num_list := num_list(10, 20, 30);
    n nested := nested('b', 'a', 'c');
    k VARCHAR2(20);
BEGIN
    m('apple') := 3; m('pear') := 5; m('fig') := 1;
    k := m.FIRST;
    WHILE k IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(k || '=' || m(k));
        k := m.NEXT(k);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(m.COUNT || ' ' || (CASE WHEN m.EXISTS('fig') THEN 'has fig' ELSE 'no fig' END));
    v.EXTEND; v(4) := 40;
    DBMS_OUTPUT.PUT_LINE(v.COUNT || ' ' || v.LIMIT || ' ' || v(v.LAST));
    n.DELETE(2);
    FOR i IN n.FIRST .. n.LAST LOOP
        IF n.EXISTS(i) THEN DBMS_OUTPUT.PUT_LINE(i || ':' || n(i)); END IF;
    END LOOP;
END;
/
