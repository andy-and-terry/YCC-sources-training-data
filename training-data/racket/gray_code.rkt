#lang racket

(define (gray n)
  (for/list ([i (in-range (arithmetic-shift 1 n))])
    (bitwise-xor i (arithmetic-shift i -1))))

(define (->bits n width)
  (~r n #:base 2 #:min-width width #:pad-string "0"))

(for ([g (gray 3)])
  (displayln (->bits g 3)))

(define (popcount n)
  (let loop ([n n] [c 0])
    (if (zero? n) c (loop (bitwise-and n (sub1 n)) (add1 c)))))

(displayln (andmap (lambda (a b) (= 1 (popcount (bitwise-xor a b))))
                   (drop-right (gray 4) 1)
                   (cdr (gray 4))))
