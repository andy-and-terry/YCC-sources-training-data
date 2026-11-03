DECLARE
  l_text   VARCHAR2(100) := LOWER('Education is beautiful');
  l_vowels VARCHAR2(5)   := 'aeiou';
  l_n      PLS_INTEGER;
BEGIN
  FOR i IN 1 .. LENGTH(l_vowels) LOOP
    l_n := LENGTH(l_text) - LENGTH(REPLACE(l_text, SUBSTR(l_vowels, i, 1)));
    DBMS_OUTPUT.PUT_LINE(SUBSTR(l_vowels, i, 1) || '=' || l_n);
  END LOOP;
END;
/
