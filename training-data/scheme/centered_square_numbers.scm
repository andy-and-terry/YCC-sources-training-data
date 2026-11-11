;; Centered square numbers 2n(n+1)+1
(define (term n) (+ (* (* 2 n) (+ n 1)) 1))

(define (show-range i)
  (when (< i 10)
    (display (term i))
    (display " ")
    (show-range (+ i 1))))
(show-range 0)
(newline)
