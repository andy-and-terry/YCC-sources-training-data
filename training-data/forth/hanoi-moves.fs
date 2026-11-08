\ Tower of Hanoi needs 2^n - 1 moves

: hanoi-count ( n -- m ) 1 swap 0 ?do 2* loop 1- ;

3 hanoi-count . cr
10 hanoi-count . cr
