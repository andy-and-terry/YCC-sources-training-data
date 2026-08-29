#lang racket

(define (binary-search vec target)
  (let loop ([low 0] [high (sub1 (vector-length vec))])
    (cond
      [(> low high) -1]
      [else
       (define mid (quotient (+ low high) 2))
       (cond
         [(= (vector-ref vec mid) target) mid]
         [(< (vector-ref vec mid) target) (loop (add1 mid) high)]
         [else (loop low (sub1 mid))])])))

(displayln (binary-search #(1 3 5 7 9 11) 7))
