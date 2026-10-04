\ Double-cell (64-bit-on-16-bit style) arithmetic with D words.
2VARIABLE TOTAL

: ADD-TO-TOTAL ( d -- ) TOTAL 2@ D+ TOTAL 2! ;

0. TOTAL 2!
100000. ADD-TO-TOTAL
250000. ADD-TO-TOTAL
-50000. ADD-TO-TOTAL
TOTAL 2@ D. CR

\ Mixed arithmetic
1000000 S>D 3 M* D. CR
123456789. 1000 UM/MOD . . CR
5. DNEGATE D. CR
-7. DABS D. CR
3. 5. D< . CR
12. 12. D= . CR
