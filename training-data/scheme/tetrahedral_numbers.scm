;; Tetrahedral numbers n(n+1)(n+2)/6
(define (term n) (quotient (* (* n (+ n 1)) (+ n 2)) 6))

(define (show-range i)
  (when (< i 10)
    (display (term i))
    (display " ")
    (show-range (+ i 1))))
(show-range 0)
(newline)
