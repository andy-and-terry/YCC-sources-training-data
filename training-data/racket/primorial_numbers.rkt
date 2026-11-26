#lang racket
;; Primorials up to 1e6, including 1; expect 8.
(define (prime? n)
  (and (> n 1)
       (let loop ([d 2])
         (cond [(> (* d d) n) #t]
               [(zero? (modulo n d)) #f]
               [else (loop (add1 d))]))))

(define values
  (let loop ([p 2] [acc 1] [out '(1)])
    (cond [(not (prime? p)) (loop (add1 p) acc out)]
          [(> (* acc p) 1000000) (reverse out)]
          [else (loop (add1 p) (* acc p) (cons (* acc p) out))])))
(displayln (length values))
(displayln values)
