CREATE OR REPLACE PACKAGE app_config AS
    c_max_retries CONSTANT PLS_INTEGER := 3;
    FUNCTION get_label RETURN VARCHAR2;
    FUNCTION init_count RETURN PLS_INTEGER;
END app_config;
/

CREATE OR REPLACE PACKAGE BODY app_config AS
    g_label VARCHAR2(30);
    g_inits PLS_INTEGER := 0;

    FUNCTION get_label RETURN VARCHAR2 IS
    BEGIN
        RETURN g_label;
    END get_label;

    FUNCTION init_count RETURN PLS_INTEGER IS
    BEGIN
        RETURN g_inits;
    END init_count;
BEGIN
    -- Runs once per session, on first reference to the package.
    g_inits := g_inits + 1;
    g_label := 'retries=' || c_max_retries;
END app_config;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(app_config.get_label);
    DBMS_OUTPUT.PUT_LINE(app_config.init_count);
END;
/
