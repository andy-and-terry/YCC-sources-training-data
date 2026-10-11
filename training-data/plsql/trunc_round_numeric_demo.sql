BEGIN
    DBMS_OUTPUT.PUT_LINE('ROUND(1234.5678, 2)  = ' || ROUND(1234.5678, 2));
    DBMS_OUTPUT.PUT_LINE('ROUND(1234.5678, -2) = ' || ROUND(1234.5678, -2));
    DBMS_OUTPUT.PUT_LINE('TRUNC(1234.5678, 2)  = ' || TRUNC(1234.5678, 2));
    DBMS_OUTPUT.PUT_LINE('TRUNC(-1.9)          = ' || TRUNC(-1.9));
    DBMS_OUTPUT.PUT_LINE('CEIL(-1.1)           = ' || CEIL(-1.1));
    DBMS_OUTPUT.PUT_LINE('FLOOR(-1.1)          = ' || FLOOR(-1.1));
    DBMS_OUTPUT.PUT_LINE('ROUND(2.5)           = ' || ROUND(2.5));
    DBMS_OUTPUT.PUT_LINE('ROUND(-2.5)          = ' || ROUND(-2.5));
    DBMS_OUTPUT.PUT_LINE('MOD(-7, 3)           = ' || MOD(-7, 3));
    DBMS_OUTPUT.PUT_LINE('REMAINDER(-7, 3)     = ' || REMAINDER(-7, 3));
    DBMS_OUTPUT.PUT_LINE('SIGN(-12)            = ' || SIGN(-12));
END;
/
