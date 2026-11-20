-- Remove consecutive duplicate characters with a regular expression.
SELECT REGEXP_REPLACE('aabbbcdd', '(.)\1+', '\1') AS deduped FROM dual;
