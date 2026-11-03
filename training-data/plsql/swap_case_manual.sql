CREATE OR REPLACE FUNCTION swap_case(p_text VARCHAR2) RETURN VARCHAR2 IS
  l_out VARCHAR2(4000);
  l_ch  VARCHAR2(1);
BEGIN
  FOR i IN 1 .. LENGTH(p_text) LOOP
    l_ch := SUBSTR(p_text, i, 1);
    IF l_ch = UPPER(l_ch) AND l_ch <> LOWER(l_ch) THEN
      l_out := l_out || LOWER(l_ch);
    ELSE
      l_out := l_out || UPPER(l_ch);
    END IF;
  END LOOP;
  RETURN l_out;
END swap_case;
/
