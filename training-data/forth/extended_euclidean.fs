VARIABLE OLD-R
VARIABLE R
VARIABLE OLD-S
VARIABLE S
VARIABLE OLD-T
VARIABLE T
VARIABLE TEMP
VARIABLE QUOT

: EXT-GCD ( a b -- gcd x y )
  R !  OLD-R !
  1 OLD-S !  0 S !
  0 OLD-T !  1 T !
  BEGIN
    R @ 0<>
  WHILE
    OLD-R @ R @ / QUOT !

    R @ TEMP !
    OLD-R @ QUOT @ R @ * - R !
    TEMP @ OLD-R !

    S @ TEMP !
    OLD-S @ QUOT @ S @ * - S !
    TEMP @ OLD-S !

    T @ TEMP !
    OLD-T @ QUOT @ T @ * - T !
    TEMP @ OLD-T !
  REPEAT
  OLD-R @ OLD-S @ OLD-T @ ;

35 15 EXT-GCD . . .
CR
