(define (div-mod a b) (values (quotient a b) (remainder a b)))
(call-with-values (lambda () (div-mod 17 5))
  (lambda (q r) (display (list q r)) (newline)))
(let-values (((q r) (div-mod 100 7))) (display (+ q r)) (newline))
