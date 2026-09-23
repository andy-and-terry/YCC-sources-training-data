-- SELECT ... INTO a scalar variable implicitly raises NO_DATA_FOUND when
-- zero rows match and TOO_MANY_ROWS when more than one row matches.
CREATE TABLE catalog_items (
    item_code VARCHAR2(10) PRIMARY KEY,
    item_name VARCHAR2(40)
);

INSERT INTO catalog_items VALUES ('A100', 'Widget');
INSERT INTO catalog_items VALUES ('A200', 'Gadget');

DECLARE
    v_name catalog_items.item_name%TYPE;
BEGIN
    BEGIN
        SELECT item_name INTO v_name FROM catalog_items WHERE item_code = 'ZZZZ';
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('no item with that code');
    END;

    BEGIN
        SELECT item_name INTO v_name FROM catalog_items WHERE item_code LIKE 'A%';
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('code prefix matched more than one row');
    END;
END;
/
