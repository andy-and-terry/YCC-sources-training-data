#lang racket
;; Thue-Morse: t(n) is the parity of the number of 1 bits in n
(define (parity n)
  (if (zero? n) 0 (bitwise-xor (bitwise-and n 1) (parity (arithmetic-shift n -1)))))

(displayln (apply string-append (for/list ([n (in-range 32)]) (number->string (parity n)))))
