CREATE TABLE contacts (
    name VARCHAR2(30),
    email VARCHAR2(50)
);

INSERT INTO contacts VALUES ('Ada', 'ada@example.com');
INSERT INTO contacts VALUES ('Bob', 'not-an-email');
INSERT INTO contacts VALUES ('Cleo', 'cleo123@sub.example.org');

BEGIN
    FOR rec IN (SELECT name, email FROM contacts) LOOP
        IF REGEXP_LIKE(rec.email, '^[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:]]{2,}$') THEN
            DBMS_OUTPUT.PUT_LINE(rec.name || ': valid email, domain = ' ||
                                  REGEXP_SUBSTR(rec.email, '@(.+)$', 1, 1, NULL, 1));
        ELSE
            DBMS_OUTPUT.PUT_LINE(rec.name || ': invalid email');
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(REGEXP_REPLACE('2024-01-15', '(\d{4})-(\d{2})-(\d{2})', '\2/\3/\1'));
END;
/
