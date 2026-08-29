(define (factorial n)
  (define (helper n acc)
    (if (<= n 1) acc (helper (- n 1) (* acc n))))
  (helper n 1))

(display (factorial 10))
(newline)
