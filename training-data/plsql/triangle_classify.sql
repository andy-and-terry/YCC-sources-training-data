DECLARE
    FUNCTION classify(a NUMBER, b NUMBER, c NUMBER) RETURN VARCHAR2 IS
    BEGIN
        IF a <= 0 OR b <= 0 OR c <= 0 OR a + b <= c OR a + c <= b OR b + c <= a THEN
            RETURN 'not a triangle';
        ELSIF a = b AND b = c THEN
            RETURN 'equilateral';
        ELSIF a = b OR b = c OR a = c THEN
            RETURN 'isosceles';
        ELSE
            RETURN 'scalene';
        END IF;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('3,3,3: ' || classify(3, 3, 3));
    DBMS_OUTPUT.PUT_LINE('3,3,5: ' || classify(3, 3, 5));
    DBMS_OUTPUT.PUT_LINE('3,4,5: ' || classify(3, 4, 5));
    DBMS_OUTPUT.PUT_LINE('1,2,3: ' || classify(1, 2, 3));
END;
/
