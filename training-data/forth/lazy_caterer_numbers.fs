\ Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
: pieces ( n -- p )  dup 1+ * 2/ 1+ ;
: main  10 0 do i pieces . loop cr ;
main
bye
