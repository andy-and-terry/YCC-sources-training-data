;; eq?, eqv?, equal? and when they differ.

(define (show label value)
  (display label)
  (display ": ")
  (display value)
  (newline))

(define a '(1 2 3))
(define b '(1 2 3))

(show "eq? same object" (eq? a a))
(show "eq? copies" (eq? a b))
(show "equal? copies" (equal? a b))
(show "eqv? numbers" (eqv? 2 2))
(show "eqv? 2 vs 2.0" (eqv? 2 2.0))
(show "= 2 vs 2.0" (= 2 2.0))
(show "eq? symbols" (eq? 'abc 'abc))
(show "equal? strings" (equal? "hi" "hi"))
(show "eqv? empty strings" (eqv? "" ""))
(show "equal? vectors" (equal? (vector 1 2) (vector 1 2)))
