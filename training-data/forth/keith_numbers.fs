\ Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
create seq 64 cells allot
variable len
variable k

: load-digits ( n -- )
  0 <# #s #>                       \ addr u
  dup k ! dup len !
  0 ?do dup i + c@ [char] 0 - seq i cells + ! loop
  drop ;

: window-sum ( -- sum )
  0 len @ len @ k @ - ?do seq i cells + @ + loop ;

: last@ ( -- v ) seq len @ 1- cells + @ ;

: keith? ( n -- flag )
  dup load-digits
  begin last@ over < while
    window-sum seq len @ cells + ! 1 len +!
  repeat
  last@ = ;

: show-keith ( -- )
  1200 10 do i keith? if i . then loop cr ;

show-keith
bye
