: GREET ( -- ) S" Hello, Forth!" TYPE CR ;
: SHOUT ( c-addr u -- ) 0 DO DUP I + C@ DUP 97 >= OVER 122 <= AND IF 32 - THEN EMIT LOOP DROP CR ;
: REVERSE-TYPE ( c-addr u -- ) BEGIN DUP WHILE 1- 2DUP + C@ EMIT REPEAT 2DROP CR ;
: CHAR-COUNT ( c-addr u ch -- n ) 0 SWAP 2SWAP 0 DO 2DUP I + C@ = IF ROT 1+ -ROT THEN LOOP 2DROP ;
GREET
S" shout me" SHOUT
S" stressed" REVERSE-TYPE
." Length: " S" four" NIP . CR
: CMP S" abc" S" abd" COMPARE . CR ;
CMP
