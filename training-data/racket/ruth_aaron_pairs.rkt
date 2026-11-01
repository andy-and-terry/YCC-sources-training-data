#lang racket

;; Sum of prime factors counted with multiplicity.
(define (sopfr n)
  (let loop ([n n] [p 2] [total 0])
    (cond [(= n 1) total]
          [(> (* p p) n) (+ total n)]
          [(zero? (modulo n p)) (loop (quotient n p) p (+ total p))]
          [else (loop n (add1 p) total)])))

(displayln
 (string-join
  (map number->string (filter (lambda (n) (= (sopfr n) (sopfr (add1 n)))) (range 2 110)))
  " "))
