CREATE OR REPLACE PACKAGE order_state_machine IS
    FUNCTION current_state RETURN VARCHAR2;
    PROCEDURE submit;
    PROCEDURE ship;
    PROCEDURE deliver;
    PROCEDURE cancel;
END order_state_machine;
/

CREATE OR REPLACE PACKAGE BODY order_state_machine IS
    state_val VARCHAR2(20) := 'NEW';

    PROCEDURE transition(p_from IN VARCHAR2, p_to IN VARCHAR2) IS
    BEGIN
        IF state_val != p_from THEN
            RAISE_APPLICATION_ERROR(-20001, 'cannot go from ' || state_val || ' to ' || p_to);
        END IF;
        state_val := p_to;
    END transition;

    FUNCTION current_state RETURN VARCHAR2 IS
    BEGIN
        RETURN state_val;
    END current_state;

    PROCEDURE submit IS
    BEGIN
        transition('NEW', 'SUBMITTED');
    END submit;

    PROCEDURE ship IS
    BEGIN
        transition('SUBMITTED', 'SHIPPED');
    END ship;

    PROCEDURE deliver IS
    BEGIN
        transition('SHIPPED', 'DELIVERED');
    END deliver;

    PROCEDURE cancel IS
    BEGIN
        IF state_val = 'DELIVERED' THEN
            RAISE_APPLICATION_ERROR(-20002, 'cannot cancel a delivered order');
        END IF;
        state_val := 'CANCELLED';
    END cancel;
END order_state_machine;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(order_state_machine.current_state);
    order_state_machine.submit;
    DBMS_OUTPUT.PUT_LINE(order_state_machine.current_state);
    order_state_machine.ship;
    DBMS_OUTPUT.PUT_LINE(order_state_machine.current_state);
    order_state_machine.deliver;
    DBMS_OUTPUT.PUT_LINE(order_state_machine.current_state);
END;
/
