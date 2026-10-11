\ LITERAL compiles a value computed at compile time
: SECONDS-PER-DAY [ 24 60 * 60 * ] LITERAL ;
SECONDS-PER-DAY . CR

: FOO ( -- n ) [ 6 7 * ] LITERAL ;
FOO . CR

: KILO 1000 ;
: MEGA [ KILO KILO * ] LITERAL ;
MEGA . CR
