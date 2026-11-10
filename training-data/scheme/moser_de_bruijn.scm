;; Read the binary digits of i as base-4 digits.
(define (moser i)
  (if (zero? i)
      0
      (+ (modulo i 2) (* 4 (moser (quotient i 2))))))

(let loop ((i 0))
  (when (< i 10)
    (display (moser i)) (display " ")
    (loop (+ i 1))))
(newline) ; 0 1 4 5 16 17 20 21 64 65
