CREATE OR REPLACE PACKAGE nocopy_demo AS
    TYPE big_list IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    PROCEDURE double_all(p_list IN OUT NOCOPY big_list);
    PROCEDURE run;
END nocopy_demo;
/

CREATE OR REPLACE PACKAGE BODY nocopy_demo AS
    PROCEDURE double_all(p_list IN OUT NOCOPY big_list) IS
    BEGIN
        -- NOCOPY passes by reference, avoiding a copy of a large collection.
        FOR i IN 1 .. p_list.COUNT LOOP
            p_list(i) := p_list(i) * 2;
        END LOOP;
    END double_all;

    PROCEDURE run IS
        v_list big_list;
    BEGIN
        FOR i IN 1 .. 5 LOOP
            v_list(i) := i;
        END LOOP;
        double_all(v_list);
        FOR i IN 1 .. v_list.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(v_list(i));
        END LOOP;
    END run;
END nocopy_demo;
/
