VARIABLE N
VARIABLE FA  VARIABLE FB  VARIABLE FC  VARIABLE FD

: .FRAC ( a b -- )  SWAP 0 .R ." /" 0 .R SPACE ;

: ADVANCE ( -- )
  N @ FB @ + FD @ /           \ k
  DUP FC @ * FA @ -           \ k e
  SWAP FD @ * FB @ -          \ e f
  FC @ FA !  FD @ FB !
  FD !  FC ! ;

: FAREY ( n -- )
  N !  0 FA !  1 FB !  1 FC !  N @ FD !
  BEGIN
    FA @ FB @ .FRAC
    FA @ 1 =  FB @ 1 =  AND 0=
  WHILE
    ADVANCE
  REPEAT
  CR ;

5 FAREY
