#lang racket

(define (prime-factors n)
  (let loop ([n n] [p 2] [acc '()])
    (cond [(= n 1) acc]
          [(> (* p p) n) (cons n acc)]
          [(zero? (remainder n p)) (loop (quotient n p) p (cons p acc))]
          [else (loop n (+ p 1) acc)])))

(define (powerful? n)
  (define fs (prime-factors n))
  (for/and ([p (remove-duplicates fs)])
    (>= (count (lambda (x) (= x p)) fs) 2)))

(displayln (filter powerful? (range 1 101)))
