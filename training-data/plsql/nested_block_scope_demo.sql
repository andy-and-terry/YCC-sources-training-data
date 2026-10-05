<<outer_blk>>
DECLARE
    x NUMBER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('outer x = ' || x);
    DECLARE
        x NUMBER := 2;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('inner x = ' || x);
        DBMS_OUTPUT.PUT_LINE('outer via label = ' || outer_blk.x);
    END;
    DBMS_OUTPUT.PUT_LINE('outer x again = ' || x);
END;
/
