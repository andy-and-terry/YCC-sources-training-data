DECLARE
    TYPE num_list IS TABLE OF NUMBER;
    xs num_list := num_list(10, 12, 15, 15, 20);
    d  num_list := num_list();
    acc NUMBER := 0;
BEGIN
    d.EXTEND(xs.COUNT);
    d(1) := xs(1);
    FOR i IN 2 .. xs.COUNT LOOP
        d(i) := xs(i) - xs(i - 1);
    END LOOP;
    FOR i IN 1 .. d.COUNT LOOP
        acc := acc + d(i);
        DBMS_OUTPUT.PUT_LINE(d(i) || ' -> ' || acc);
    END LOOP;
END;
/
