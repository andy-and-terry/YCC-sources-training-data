VARIABLE POS
VARIABLE LIMIT
VARIABLE RUN-CHAR
VARIABLE RUN-LEN

: RLE ( addr len -- )
  OVER + LIMIT !
  POS !
  BEGIN
    POS @ LIMIT @ <
  WHILE
    POS @ C@ RUN-CHAR !
    1 RUN-LEN !
    POS @ 1+ POS !
    BEGIN
      POS @ LIMIT @ < POS @ C@ RUN-CHAR @ = AND
    WHILE
      RUN-LEN @ 1+ RUN-LEN !
      POS @ 1+ POS !
    REPEAT
    RUN-CHAR @ EMIT
    RUN-LEN @ .
  REPEAT ;

S" aaabbbccd" RLE
CR
