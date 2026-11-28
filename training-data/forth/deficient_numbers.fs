\ deficient numbers up to 20: sigma(n) < 2n
: sigma ( n -- s )  0 swap dup 1+ 1 do dup i mod 0= if swap i + swap then loop drop ;
: deficient ( -- )  21 1 do i sigma i 2* < if i . then loop cr ;
deficient
bye
