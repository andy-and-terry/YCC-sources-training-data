CREATE OR REPLACE FUNCTION to_roman(p_n IN NUMBER) RETURN VARCHAR2 IS
    TYPE num_table IS TABLE OF NUMBER;
    TYPE str_table IS TABLE OF VARCHAR2(2);
    values_arr num_table := num_table(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1);
    symbols_arr str_table := str_table('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I');
    result VARCHAR2(20) := '';
    remaining NUMBER := p_n;
BEGIN
    FOR i IN 1..values_arr.COUNT LOOP
        WHILE remaining >= values_arr(i) LOOP
            result := result || symbols_arr(i);
            remaining := remaining - values_arr(i);
        END LOOP;
    END LOOP;
    RETURN result;
END to_roman;
/
