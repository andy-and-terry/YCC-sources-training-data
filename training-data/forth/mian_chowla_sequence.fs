\ Greedy sequence whose pairwise sums are all distinct.
create seq  8 cells allot
create used 256 allot
create fresh 256 allot
variable n
variable cand
variable ok

: try-candidate ( -- )
  fresh 256 erase
  true ok !
  cand @ seq n @ cells + !
  n @ 1+ 0 do
    seq i cells + @ cand @ +        \ s
    dup used + c@ over fresh + c@ or if ok off then
    fresh + 1 swap c!
  loop
  ok @ if
    256 0 do fresh i + c@ if 1 used i + c! then loop
    1 n +!
  then ;

: main
  used 256 erase  0 n !  1 cand !
  begin n @ 8 < while try-candidate 1 cand +! repeat
  8 0 do seq i cells + @ . loop cr ;
main bye
