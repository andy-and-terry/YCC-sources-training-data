#lang racket
;; Moebius function: 0 if n has a squared prime factor, else (-1)^k.
(define (mobius n)
  (let loop ([m n] [p 2] [acc 1])
    (cond [(> (* p p) m) (if (> m 1) (- acc) acc)]
          [(zero? (remainder m p))
           (define m2 (quotient m p))
           (if (zero? (remainder m2 p)) 0 (loop m2 (+ p 1) (- acc)))]
          [else (loop m (+ p 1) acc)])))

(displayln (string-join (map (compose number->string mobius) (range 1 31)) " "))
