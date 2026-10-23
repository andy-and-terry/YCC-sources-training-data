-- Row limiting clause (Oracle 12c+): FETCH FIRST / OFFSET replace the old
-- ROWNUM sub-select idiom for top-N and paging queries.
DECLARE
    v_page_size CONSTANT PLS_INTEGER := 3;
    v_line      VARCHAR2(200);
BEGIN
    -- Top 3 values of a generated sequence, largest first
    v_line := '';
    FOR r IN (SELECT n FROM (SELECT level * 7 MOD 23 AS n FROM dual CONNECT BY level <= 15)
               ORDER BY n DESC
               FETCH FIRST 3 ROWS ONLY) LOOP
        v_line := v_line || r.n || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('top 3: ' || v_line);

    -- Paging through results with OFFSET and a bind variable
    FOR v_page IN 0 .. 2 LOOP
        v_line := '';
        FOR r IN (SELECT level AS n FROM dual CONNECT BY level <= 8
                   ORDER BY n
                  OFFSET v_page * v_page_size ROWS FETCH NEXT v_page_size ROWS ONLY) LOOP
            v_line := v_line || r.n || ' ';
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('page ' || (v_page + 1) || ': ' || v_line);
    END LOOP;

    -- WITH TIES keeps rows that tie with the last row returned
    v_line := '';
    FOR r IN (SELECT MOD(level, 4) AS n FROM dual CONNECT BY level <= 10
               ORDER BY n
               FETCH FIRST 2 ROWS WITH TIES) LOOP
        v_line := v_line || r.n || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('with ties: ' || v_line);
END;
/
