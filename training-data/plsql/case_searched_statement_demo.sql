DECLARE
    v_bmi    NUMBER;
    v_weight NUMBER := 82;
    v_height NUMBER := 1.78;
    v_label  VARCHAR2(20);
BEGIN
    v_bmi := ROUND(v_weight / (v_height * v_height), 1);
    CASE
        WHEN v_bmi < 18.5 THEN v_label := 'underweight';
        WHEN v_bmi < 25   THEN v_label := 'normal';
        WHEN v_bmi < 30   THEN v_label := 'overweight';
        ELSE v_label := 'obese';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('BMI ' || v_bmi || ' is ' || v_label);
END;
/
