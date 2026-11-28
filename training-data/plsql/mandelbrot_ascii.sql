DECLARE
  zr NUMBER; zi NUMBER; t NUMBER; n PLS_INTEGER;
  line VARCHAR2(80);
BEGIN
  FOR yi IN -5 .. 5 LOOP
    line := '';
    FOR xi IN -40 .. 12 LOOP
      zr := 0; zi := 0; n := 0;
      WHILE n < 30 AND zr * zr + zi * zi < 4 LOOP
        t := zr * zr - zi * zi + xi / 20;
        zi := 2 * zr * zi + yi / 5;
        zr := t;
        n := n + 1;
      END LOOP;
      line := line || CASE WHEN n = 30 THEN '#' ELSE '.' END;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(line);
  END LOOP;
END;
/
