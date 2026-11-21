\ Disarium numbers: digits raised to their 1-based positions sum to n.
variable tot

: ipow ( b e -- b^e ) 1 swap 0 ?do over * loop nip ;

: disarium? ( n -- flag )
  dup 0 <# #s #>                   \ n addr u
  0 tot !
  dup 0 ?do
    over i + c@ [char] 0 - i 1+ ipow tot +!
  loop
  2drop tot @ = ;

: show-disarium ( -- )
  1000 1 do i disarium? if i . then loop cr ;

show-disarium
bye
