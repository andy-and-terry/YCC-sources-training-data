;; R7RS integer division returns quotient and remainder as two values.
;; floor/ rounds toward negative infinity, truncate/ toward zero.

(call-with-values (lambda () (floor/ 7 2))
  (lambda (q r) (display (list q r)) (newline)))
(call-with-values (lambda () (floor/ -7 2))
  (lambda (q r) (display (list q r)) (newline)))
(call-with-values (lambda () (truncate/ -7 2))
  (lambda (q r) (display (list q r)) (newline)))

(let-values (((q r) (floor/ 17 5)))
  (display (+ (* q 5) r)) (newline))

(display (list (floor-quotient -7 2) (floor-remainder -7 2))) (newline)
(display (list (truncate-quotient -7 2) (truncate-remainder -7 2))) (newline)
(display (list (modulo -7 2) (remainder -7 2))) (newline)

(display (exact-integer? 5)) (newline)
(display (exact-integer? 5.0)) (newline)

(define-values (root rem) (exact-integer-sqrt 17))
(display (list root rem)) (newline)
