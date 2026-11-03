#lang racket

(define (count-primes-below n)
  (if (< n 3)
      0
      (let ([composite (make-vector n #f)])
        (for/sum ([i (in-range 2 n)] #:unless (vector-ref composite i))
          (for ([j (in-range (* i i) n i)]) (vector-set! composite j #t))
          1))))

(displayln (count-primes-below 100))
