(define (min-max lst)
  (values (apply min lst) (apply max lst)))

(call-with-values
  (lambda () (min-max '(4 9 1 7)))
  (lambda (lo hi)
    (display (list lo hi))
    (newline)))

(let-values (((q r) (floor/ 17 5)))
  (display (list q r))
  (newline))
