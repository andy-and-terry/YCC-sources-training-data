\ Which of 3 rails does position i land on?
: RAIL ( i rails -- r )
  DUP 1- 2 * { rails period }
  period MOD DUP rails < IF EXIT THEN
  period SWAP - ;

: SHOW-RAILS 15 0 DO I 3 RAIL . LOOP CR ;
SHOW-RAILS
