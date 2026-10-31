#lang racket

(define (prime-factors n)
  (let loop ([n n] [p 2] [acc '()])
    (cond [(= n 1) (reverse acc)]
          [(> (* p p) n) (reverse (cons n acc))]
          [(zero? (remainder n p)) (loop (quotient n p) p (cons p acc))]
          [else (loop n (+ p 1) acc)])))

(define (sphenic? n)
  (define fs (prime-factors n))
  (and (= (length fs) 3) (= (length (remove-duplicates fs)) 3)))

(displayln (filter sphenic? (range 2 80)))
