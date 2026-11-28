(define (stern i)
  (cond ((= i 0) 0)
        ((= i 1) 1)
        ((even? i) (stern (quotient i 2)))
        (else (+ (stern (quotient i 2)) (stern (+ (quotient i 2) 1))))))

(display (map stern '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14)))
(newline) ; (0 1 1 2 1 3 2 3 1 4 3 5 2 5 3)
