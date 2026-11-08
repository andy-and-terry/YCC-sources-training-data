#lang racket
(define (crc8 bs)
  (for/fold ([crc 0]) ([b bs])
    (for/fold ([c (bitwise-xor crc b)]) ([_ 8])
      (if (zero? (bitwise-and c #x80))
          (bitwise-and (arithmetic-shift c 1) #xFF)
          (bitwise-and (bitwise-xor (arithmetic-shift c 1) #x07) #xFF)))))
(displayln (number->string (crc8 (bytes->list #"123456789")) 16))
