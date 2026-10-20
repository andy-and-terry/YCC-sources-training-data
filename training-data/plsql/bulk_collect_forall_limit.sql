DECLARE
    TYPE id_tab IS TABLE OF NUMBER;
    ids id_tab;
    squares id_tab := id_tab();
    CURSOR c IS SELECT LEVEL AS n FROM dual CONNECT BY LEVEL <= 25;
    batches PLS_INTEGER := 0;
BEGIN
    SELECT LEVEL BULK COLLECT INTO ids FROM dual CONNECT BY LEVEL <= 10;
    DBMS_OUTPUT.PUT_LINE('collected ' || ids.COUNT);
    squares.EXTEND(ids.COUNT);
    FOR i IN 1 .. ids.COUNT LOOP squares(i) := ids(i) * ids(i); END LOOP;
    DBMS_OUTPUT.PUT_LINE('last square ' || squares(squares.LAST));
    OPEN c;
    LOOP
        FETCH c BULK COLLECT INTO ids LIMIT 10;
        EXIT WHEN ids.COUNT = 0;
        batches := batches + 1;
        EXIT WHEN c%NOTFOUND AND ids.COUNT = 0;
    END LOOP;
    CLOSE c;
    DBMS_OUTPUT.PUT_LINE('batches ' || batches);
END;
/
