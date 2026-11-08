#lang racket
(define (varint n)
  (if (< n 128)
      (list n)
      (cons (bitwise-ior (bitwise-and n 127) 128) (varint (arithmetic-shift n -7)))))
(displayln (map (λ (b) (number->string b 16)) (varint 300)))
