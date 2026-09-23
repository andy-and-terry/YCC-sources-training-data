-- Classic recursive algorithm: move p_n disks from p_from to p_to using
-- p_aux as the spare peg, never placing a larger disk on a smaller one.
CREATE OR REPLACE PROCEDURE tower_of_hanoi(
    p_n    IN NUMBER,
    p_from IN VARCHAR2,
    p_to   IN VARCHAR2,
    p_aux  IN VARCHAR2
) IS
BEGIN
    IF p_n = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Move disk 1 from ' || p_from || ' to ' || p_to);
        RETURN;
    END IF;
    tower_of_hanoi(p_n - 1, p_from, p_aux, p_to);
    DBMS_OUTPUT.PUT_LINE('Move disk ' || p_n || ' from ' || p_from || ' to ' || p_to);
    tower_of_hanoi(p_n - 1, p_aux, p_to, p_from);
END tower_of_hanoi;
/

BEGIN
    tower_of_hanoi(3, 'A', 'C', 'B');
    DBMS_OUTPUT.PUT_LINE('total moves: ' || (POWER(2, 3) - 1));
END;
/
