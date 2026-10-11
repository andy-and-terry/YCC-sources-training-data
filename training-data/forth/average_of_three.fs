: AVG3 ( a b c -- avg ) + + 3 / ;
: AVG-N ( n1 ... nk k -- avg ) DUP >R 1 ?DO + LOOP R> / ;

10 20 30 AVG3 . CR
7 8 9 AVG3 . CR
2 4 6 8 10 5 AVG-N . CR
