SET SERVEROUTPUT ON

-- s-gonal number: P(s, n) = ((s - 2) * n^2 - (s - 4) * n) / 2
DECLARE
    FUNCTION polygonal(s IN NUMBER, n IN NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN ((s - 2) * n * n - (s - 4) * n) / 2;
    END polygonal;

    PROCEDURE show(p_label IN VARCHAR2, s IN NUMBER) IS
        line VARCHAR2(200) := p_label || ':';
    BEGIN
        FOR n IN 1..10 LOOP
            line := line || ' ' || polygonal(s, n);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(line);
    END show;
BEGIN
    show('Triangular', 3);
    show('Pentagonal', 5);
    show('Hexagonal', 6);
END;
/
