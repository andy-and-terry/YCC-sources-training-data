\ */ multiplies then divides using a double-width intermediate
: PERCENT ( n pct -- n*pct/100 ) 100 */ ;

200 15 PERCENT . CR
1000000 37 PERCENT . CR

: SCALE ( n num den -- n' ) */ ;
90 2 3 SCALE . CR

: */MOD-DEMO ( -- ) 17 3 5 */MOD . . CR ;
*/MOD-DEMO
