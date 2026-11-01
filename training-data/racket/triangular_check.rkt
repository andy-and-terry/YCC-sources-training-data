#lang racket

;; n is triangular iff 8n + 1 is a perfect square.
(define (triangular? n)
  (define s (+ (* 8 n) 1))
  (define r (integer-sqrt s))
  (= (* r r) s))

(displayln (string-join (map number->string (filter triangular? (range 0 21))) " "))
