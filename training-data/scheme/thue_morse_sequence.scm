;; Thue-Morse: t(n) is the parity of the number of 1 bits in n
(define (parity n)
  (if (= n 0)
      0
      (modulo (+ (modulo n 2) (parity (quotient n 2))) 2)))

(do ((n 0 (+ n 1)))
    ((= n 32))
  (display (parity n)))
(newline)
