CREATE OR REPLACE PROCEDURE record_type_demo IS
    TYPE person_rec IS RECORD (
        name VARCHAR2(50),
        age NUMBER
    );
    p person_rec;
BEGIN
    p.name := 'Alice';
    p.age := 30;
    DBMS_OUTPUT.PUT_LINE(p.name || ' is ' || p.age || ' years old');
END record_type_demo;
/
