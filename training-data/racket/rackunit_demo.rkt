#lang racket
(require rackunit)

(define (clamp x lo hi) (max lo (min hi x)))

(check-equal? (clamp 5 0 10) 5)
(check-equal? (clamp -3 0 10) 0)
(check-equal? (clamp 99 0 10) 10)
(check-true (even? (clamp 4 0 10)))
(check-= (/ 1.0 3) 0.3333 0.001)
(check-exn exn:fail:contract:divide-by-zero? (lambda () (/ 1 0)))
(check-not-false (member 2 '(1 2 3)))

(test-case "list operations"
  (check-equal? (reverse '(1 2 3)) '(3 2 1))
  (check-pred list? '()))

(define-simple-check (check-sorted lst)
  (equal? lst (sort lst <)))
(check-sorted '(1 2 3))

(displayln "all checks passed")
