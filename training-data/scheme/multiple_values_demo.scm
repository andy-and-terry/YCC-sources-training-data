;; R7RS multiple return values via `values` and `call-with-values`.

(define (div-mod a b)
  (values (quotient a b) (remainder a b)))

(call-with-values
  (lambda () (div-mod 17 5))
  (lambda (q r)
    (display (list 'quotient q 'remainder r))
    (newline)))

(call-with-values
  (lambda () (div-mod 20 6))
  (lambda (q r) (display (+ q r)) (newline)))

(define (min-max lst)
  (values (apply min lst) (apply max lst)))

(call-with-values
  (lambda () (min-max '(4 2 9 1 7)))
  (lambda (lo hi)
    (display (list 'min lo 'max hi))
    (newline)))
