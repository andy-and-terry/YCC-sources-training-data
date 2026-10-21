\ Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
variable a  variable b  variable c

: step ( -- )                \ advance (a b c) -> (b c a+b+c)
  a @ b @ + c @ +           \ next
  b @ a !  c @ b !  c ! ;

: tribonacci ( n -- )
  0 a !  0 b !  1 c !
  0 do a @ . step loop cr ;

." Tribonacci: " 15 tribonacci
bye
