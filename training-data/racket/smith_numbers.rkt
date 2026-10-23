#lang racket

(define (digit-sum n)
  (if (< n 10) n (+ (remainder n 10) (digit-sum (quotient n 10)))))

;; prime factors with multiplicity
(define (prime-factors n)
  (let loop ([m n] [p 2] [acc '()])
    (cond [(= m 1) (reverse acc)]
          [(> (* p p) m) (reverse (cons m acc))]
          [(zero? (remainder m p)) (loop (quotient m p) p (cons p acc))]
          [else (loop m (+ p 1) acc)])))

(define (smith? n)
  (define factors (prime-factors n))
  (and (> (length factors) 1)
       (= (digit-sum n) (apply + (map digit-sum factors)))))

(displayln (string-join (map number->string (filter smith? (range 4 100))) " "))
