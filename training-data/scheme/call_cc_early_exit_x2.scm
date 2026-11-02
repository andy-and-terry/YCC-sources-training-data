(define (find-first pred lst)
  (call/cc
    (lambda (return)
      (for-each (lambda (x) (if (pred x) (return x))) lst)
      #f)))
(display (find-first even? '(1 3 6 7)))
(newline)
