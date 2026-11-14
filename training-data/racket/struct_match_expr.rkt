#lang racket
(struct num (n))
(struct add (l r))

(define (ev e)
  (match e
    [(num n) n]
    [(add l r) (+ (ev l) (ev r))]))

(displayln (ev (add (num 1) (add (num 2) (num 3)))))
