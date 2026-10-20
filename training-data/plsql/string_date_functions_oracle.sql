SELECT UPPER('abc') u, INITCAP('hello world') i, LPAD('7', 3, '0') l, RPAD('x', 3, '.') r,
       SUBSTR('Hello', 2, 3) s, INSTR('hello', 'l') p, REPLACE('a-b', '-', '+') rp,
       TRIM('  x ') t, LENGTH('abc') len, REGEXP_SUBSTR('ab123cd', '\d+') re,
       REGEXP_REPLACE('a1b2', '\d', '#') rr, TRANSLATE('abc', 'ab', 'xy') tr
FROM dual;

SELECT TO_CHAR(DATE '2024-03-05', 'YYYY-MM-DD Day') d1,
       TO_CHAR(1234567.891, '9,999,999.99') n1,
       ADD_MONTHS(DATE '2024-01-31', 1) am,
       LAST_DAY(DATE '2024-02-10') ld,
       MONTHS_BETWEEN(DATE '2024-03-15', DATE '2024-01-15') mb,
       TRUNC(DATE '2024-03-15', 'MM') tm,
       NEXT_DAY(DATE '2024-03-05', 'MONDAY') nd,
       TO_DATE('05/03/2024', 'DD/MM/YYYY') + 7 plus7,
       EXTRACT(YEAR FROM DATE '2024-03-05') y,
       NVL(NULL, 'default') nv, NVL2('x', 'has', 'none') n2, COALESCE(NULL, NULL, 3) co,
       DECODE(2, 1, 'one', 2, 'two', 'many') dc
FROM dual;
