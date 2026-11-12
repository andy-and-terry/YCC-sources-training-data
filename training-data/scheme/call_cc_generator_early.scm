(define (find-neg lst)
  (call-with-current-continuation
    (lambda (k) (for-each (lambda (x) (if (< x 0) (k x))) lst) #f)))
(display (find-neg '(3 4 -2 5))) (newline)
