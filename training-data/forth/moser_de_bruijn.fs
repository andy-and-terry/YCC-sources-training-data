\ Read the binary digits of i as base-4 digits.
variable mv
variable mp

: moser ( i -- value )
  0 mv ! 1 mp !
  begin dup 0> while
    dup 1 and if mp @ mv +! then
    mp @ 4 * mp !
    2/
  repeat drop mv @ ;

: show-moser 10 0 do i moser . loop cr ;
show-moser   \ 0 1 4 5 16 17 20 21 64 65
