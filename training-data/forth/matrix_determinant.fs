CREATE MAT 6 , 1 , 1 , 4 , -2 , 5 , 2 , 8 , 7 ,

: MAT-ELEM ( row col -- addr ) SWAP 3 * + CELLS MAT + ;
: MAT@ ( row col -- n ) MAT-ELEM @ ;

VARIABLE A  VARIABLE B  VARIABLE C
VARIABLE D  VARIABLE E  VARIABLE F
VARIABLE G  VARIABLE H  VARIABLE K

: LOAD-MAT ( -- )
  0 0 MAT@ A !
  0 1 MAT@ B !
  0 2 MAT@ C !
  1 0 MAT@ D !
  1 1 MAT@ E !
  1 2 MAT@ F !
  2 0 MAT@ G !
  2 1 MAT@ H !
  2 2 MAT@ K ! ;

: DET3 ( -- det )
  LOAD-MAT
  A @ E @ K @ * F @ H @ * - *
  B @ D @ K @ * F @ G @ * - *
  -
  C @ D @ H @ * E @ G @ * - *
  + ;

DET3 .
CR
