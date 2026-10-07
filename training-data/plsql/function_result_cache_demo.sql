-- RESULT_CACHE memoizes deterministic lookups across sessions.
CREATE OR REPLACE FUNCTION tax_rate(p_region IN VARCHAR2)
    RETURN NUMBER
    RESULT_CACHE
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('computing rate for ' || p_region);
    RETURN CASE UPPER(p_region)
               WHEN 'EU' THEN 0.21
               WHEN 'US' THEN 0.07
               ELSE 0
           END;
END tax_rate;
/

DECLARE
    v_rate NUMBER;
BEGIN
    v_rate := tax_rate('EU');
    v_rate := tax_rate('EU');  -- served from the cache, no message printed
    v_rate := tax_rate('US');
    DBMS_OUTPUT.PUT_LINE('last rate: ' || v_rate);
END;
/
