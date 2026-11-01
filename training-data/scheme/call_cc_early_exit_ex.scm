(define (find-first pred lst)
  (call-with-current-continuation
    (lambda (return)
      (for-each (lambda (x) (if (pred x) (return x))) lst)
      #f)))
(display (find-first even? '(1 3 6 7))) (newline)
(display (find-first even? '(1 3))) (newline)
