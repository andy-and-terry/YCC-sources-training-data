: day-name ( n -- )
  case
    1 of ." Mon" endof
    2 of ." Tue" endof
    3 of ." Wed" endof
    ." Other"
  endcase ;
2 day-name cr
9 day-name cr
