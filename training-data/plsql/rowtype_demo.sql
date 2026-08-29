CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    price NUMBER
);

CREATE OR REPLACE PROCEDURE rowtype_demo(p_id IN NUMBER) IS
    product_row products%ROWTYPE;
BEGIN
    SELECT * INTO product_row FROM products WHERE product_id = p_id;
    DBMS_OUTPUT.PUT_LINE(product_row.product_name || ': ' || product_row.price);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Product not found');
END rowtype_demo;
/
