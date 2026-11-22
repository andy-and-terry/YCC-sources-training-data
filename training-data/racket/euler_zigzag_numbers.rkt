#lang racket
;; Euler zigzag numbers via the Seidel-Entringer boustrophedon.
(define (step row)
  (reverse (for/fold ([acc '(0)]) ([x (in-list (reverse row))]) (cons (+ (car acc) x) acc))))

(displayln
 (string-join
  (let loop ([k 10] [row '(1)] [acc '()])
    (if (zero? k) (reverse acc) (loop (- k 1) (step row) (cons (number->string (last row)) acc))))
  " "))
