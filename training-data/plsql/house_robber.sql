CREATE OR REPLACE FUNCTION house_robber(p_houses IN SYS.ODCINUMBERLIST) RETURN NUMBER IS
    prev_ NUMBER := 0;
    curr_ NUMBER := 0;
    next_ NUMBER;
BEGIN
    FOR i IN 1..p_houses.COUNT LOOP
        next_ := GREATEST(curr_, prev_ + p_houses(i));
        prev_ := curr_;
        curr_ := next_;
    END LOOP;
    RETURN curr_;
END house_robber;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(house_robber(SYS.ODCINUMBERLIST(2, 7, 9, 3, 1)));
END;
/
