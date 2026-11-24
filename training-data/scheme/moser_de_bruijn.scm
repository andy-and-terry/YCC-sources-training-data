;; Moser-de Bruijn sequence: binary digits of n read in base 4.
(define (moser n)
  (if (= n 0)
      0
      (+ (remainder n 2) (* 4 (moser (quotient n 2))))))

(do ((n 0 (+ n 1))) ((>= n 12))
  (display (moser n)) (display " "))
(newline)
