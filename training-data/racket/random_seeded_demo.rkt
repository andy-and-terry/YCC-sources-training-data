#lang racket

;; A pseudo-random generator seeded explicitly gives reproducible sequences.
(define (make-gen seed)
  (define g (make-pseudo-random-generator))
  (parameterize ([current-pseudo-random-generator g])
    (random-seed seed))
  g)

(define (take-randoms g n)
  (for/list ([_ (in-range n)])
    (random 100 g)))

(define g1 (make-gen 7))
(define g2 (make-gen 7))
(define g3 (make-gen 8))

(define r1 (take-randoms g1 5))
(define r2 (take-randoms g2 5))
(displayln (equal? r1 r2))
(displayln (andmap (lambda (n) (< -1 n 100)) r1))
(displayln (equal? r1 (take-randoms g3 5)))

(define shuffled (shuffle '(1 2 3 4 5)))
(displayln (sort shuffled <))
