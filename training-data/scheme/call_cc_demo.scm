(define (find-first-negative lst)
  (call-with-current-continuation
   (lambda (return)
     (for-each (lambda (x) (if (< x 0) (return x))) lst)
     #f)))

(display (find-first-negative '(1 2 3 -4 5)))
(newline)
(display (find-first-negative '(1 2 3)))
(newline)
