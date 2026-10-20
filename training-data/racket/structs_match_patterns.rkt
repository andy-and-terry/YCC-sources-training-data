#lang racket
(struct point (x y) #:transparent)
(struct circle (center r) #:transparent)

(define (describe s)
  (match s
    [(point 0 0) "origin"]
    [(point x 0) (format "on x-axis at ~a" x)]
    [(circle (point cx cy) r) #:when (> r 10) (format "big circle at ~a,~a" cx cy)]
    [(circle _ r) (format "circle r=~a" r)]
    [(list a b ...) (format "list head ~a rest ~a" a b)]
    [(? string? str) (string-upcase str)]
    [_ "unknown"]))

(for ([s (list (point 0 0) (point 3 0) (circle (point 1 2) 20) (circle (point 0 1) 2) '(1 2 3) "hi" 42)])
  (displayln (describe s)))
(displayln (struct-copy point (point 1 2) [y 9]))
