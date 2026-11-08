(define (crc8-byte crc b)
  (let loop ((c (bitwise-xor crc b)) (i 0))
    (if (= i 8) c
        (loop (if (zero? (bitwise-and c 128))
                  (bitwise-and (arithmetic-shift c 1) 255)
                  (bitwise-and (bitwise-xor (arithmetic-shift c 1) 7) 255))
              (+ i 1)))))

(define (crc8 str)
  (fold-left crc8-byte 0 (map char->integer (string->list str))))

(display (number->string (crc8 "123456789") 16))
(newline)
