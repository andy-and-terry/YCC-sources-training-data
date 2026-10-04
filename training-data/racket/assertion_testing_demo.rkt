#lang racket

(require rackunit)

(define (square x) (* x x))
(define (safe-div a b) (if (zero? b) (raise 'div-by-zero) (/ a b)))

(check-equal? (square 5) 25 "square of 5")
(check-true (even? (square 4)))
(check-not-false (member 3 '(1 2 3)))
(check-= (sqrt 2) 1.41421 0.0001)
(check-exn (lambda (e) (eq? e 'div-by-zero)) (lambda () (safe-div 1 0)))
(check-pred string? "text")
(check-not-equal? 1 2)

(test-case "list operations"
  (check-equal? (reverse '(1 2 3)) '(3 2 1))
  (check-equal? (length '()) 0))

(displayln "all checks passed")
