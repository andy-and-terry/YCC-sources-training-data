DECLARE
    v_plain  VARCHAR2(100) := 'Hello, World!';
    v_cipher VARCHAR2(100);
BEGIN
    v_cipher := TRANSLATE(v_plain,
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
        'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm');
    DBMS_OUTPUT.PUT_LINE(v_plain || ' -> ' || v_cipher);
    v_plain := TRANSLATE(v_cipher,
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
        'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm');
    DBMS_OUTPUT.PUT_LINE(v_cipher || ' -> ' || v_plain);
END;
/
