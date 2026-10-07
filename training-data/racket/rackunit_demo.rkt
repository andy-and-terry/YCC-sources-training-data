#lang racket
(require rackunit)

(define (add a b) (+ a b))

(check-equal? (add 2 3) 5 "addition")
(check-not-equal? (add 1 1) 3)
(check-true (even? 4))
(check-pred string? "hi")
(check-= (/ 1.0 3) 0.3333 0.001)
(check-exn exn:fail:contract:divide-by-zero? (lambda () (/ 1 0)))

(test-case "list ops"
  (check-equal? (reverse '(1 2 3)) '(3 2 1))
  (check-equal? (length '()) 0))

(displayln "all checks passed")
