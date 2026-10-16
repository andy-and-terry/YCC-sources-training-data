#lang racket
(require rackunit)

(define (square x) (* x x))

(check-equal? (square 4) 16 "square of 4")
(check-not-equal? (square 3) 6)
(check-true (even? (square 2)))
(check-false (negative? (square -3)))
(check-eq? 'a 'a)
(check-= (sqrt 2.0) 1.4142 0.001)
(check-pred string? "yes")
(check-exn exn:fail:contract:divide-by-zero? (lambda () (/ 1 0)))
(check-not-exn (lambda () (square 2)))
(check-within 0.3 (+ 0.1 0.2) 1e-9)
(check-regexp-match #rx"^a+$" "aaa")
(check-match '(1 2) (list _ _))

(test-case "list ops"
  (check-equal? (reverse '(1 2 3)) '(3 2 1))
  (check-equal? (length '()) 0))

(displayln "all checks passed")
