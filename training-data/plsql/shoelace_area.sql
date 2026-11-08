DECLARE
    TYPE num_list IS TABLE OF NUMBER;
    x num_list := num_list(0, 4, 4, 0);
    y num_list := num_list(0, 0, 3, 3);
    s NUMBER := 0;
    j PLS_INTEGER;
BEGIN
    FOR i IN 1 .. x.COUNT LOOP
        j := MOD(i, x.COUNT) + 1;
        s := s + x(i) * y(j) - x(j) * y(i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Area: ' || ABS(s) / 2);
END;
/
