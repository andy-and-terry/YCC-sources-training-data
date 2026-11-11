;; Lazy caterer sequence: max pieces from n cuts
(define (term n) (+ (quotient (* n (+ n 1)) 2) 1))

(define (show-range i)
  (when (< i 10)
    (display (term i))
    (display " ")
    (show-range (+ i 1))))
(show-range 0)
(newline)
