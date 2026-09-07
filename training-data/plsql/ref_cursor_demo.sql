CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    price NUMBER
);

INSERT INTO products VALUES (1, 'Widget', 9.99);
INSERT INTO products VALUES (2, 'Gadget', 19.99);
INSERT INTO products VALUES (3, 'Gizmo', 4.99);

CREATE OR REPLACE PROCEDURE get_products_above(p_min_price IN NUMBER, p_cursor OUT SYS_REFCURSOR) IS
BEGIN
    OPEN p_cursor FOR
        SELECT product_name, price
        FROM products
        WHERE price >= p_min_price
        ORDER BY price;
END get_products_above;
/

CREATE OR REPLACE PROCEDURE print_products_above(p_min_price IN NUMBER) IS
    v_cursor SYS_REFCURSOR;
    v_name products.product_name%TYPE;
    v_price products.price%TYPE;
BEGIN
    get_products_above(p_min_price, v_cursor);
    LOOP
        FETCH v_cursor INTO v_name, v_price;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_name || ': ' || v_price);
    END LOOP;
    CLOSE v_cursor;
END print_products_above;
/
