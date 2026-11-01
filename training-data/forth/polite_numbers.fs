\ Ways to write n as a sum of two or more consecutive positive integers.
variable n
variable k
variable ways

: polite-ways ( n -- ways )
  n !  2 k !  0 ways !
  begin
    k @ dup 1+ * 2/ n @ <=
  while
    n @  k @ dup 1- * 2/ -  k @ mod 0= if 1 ways +! then
    1 k +!
  repeat
  ways @ ;

: main  17 1 do i polite-ways . loop cr ;
main bye
