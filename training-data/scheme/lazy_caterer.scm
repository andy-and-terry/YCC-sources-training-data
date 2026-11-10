(define (pieces cuts) (quotient (+ (* cuts cuts) cuts 2) 2))

(let loop ((n 0))
  (when (< n 10)
    (display (pieces n)) (display " ")
    (loop (+ n 1))))
(newline) ; 1 2 4 7 11 16 22 29 37 46
