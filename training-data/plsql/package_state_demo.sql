CREATE OR REPLACE PACKAGE counter_pkg IS
    FUNCTION increment RETURN NUMBER;
    PROCEDURE reset_counter;
END counter_pkg;
/

CREATE OR REPLACE PACKAGE BODY counter_pkg IS
    counter_value NUMBER := 0;

    FUNCTION increment RETURN NUMBER IS
    BEGIN
        counter_value := counter_value + 1;
        RETURN counter_value;
    END increment;

    PROCEDURE reset_counter IS
    BEGIN
        counter_value := 0;
    END reset_counter;
END counter_pkg;
/
