\ Central Delannoy numbers via a rolling row.
8 CONSTANT N
CREATE D N 1+ CELLS ALLOT

: INIT N 1+ 0 DO 1 D I CELLS + ! LOOP ;
: STEP ( -- ) D @ ( diag-prev ) N 1+ 1 DO
    D I CELLS + @ ( up ) SWAP ( up diag )
    OVER D I 1- CELLS + @ + OVER + ( up diag+... ) NIP
    DUP D I CELLS + ! LOOP DROP ;
INIT
: SHOW 1 . 6 0 DO STEP LOOP ;
SHOW CR
