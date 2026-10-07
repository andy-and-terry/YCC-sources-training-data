-- INSTEAD OF triggers let DML target a non-key-preserving view by
-- redirecting the write to the underlying base tables.
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50)
);

CREATE TABLE customer_emails (
    customer_id NUMBER PRIMARY KEY,
    email VARCHAR2(100)
);

CREATE OR REPLACE VIEW customer_details AS
SELECT c.customer_id, c.customer_name, e.email
FROM customers c
JOIN customer_emails e ON e.customer_id = c.customer_id;

CREATE OR REPLACE TRIGGER customer_details_insert
INSTEAD OF INSERT ON customer_details
FOR EACH ROW
BEGIN
    INSERT INTO customers (customer_id, customer_name)
    VALUES (:NEW.customer_id, :NEW.customer_name);

    INSERT INTO customer_emails (customer_id, email)
    VALUES (:NEW.customer_id, :NEW.email);
END customer_details_insert;
/

BEGIN
    INSERT INTO customer_details (customer_id, customer_name, email)
    VALUES (1, 'Ada Lovelace', 'ada@example.com');
END;
/
