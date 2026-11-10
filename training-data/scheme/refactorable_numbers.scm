(define (tau n)
  (let loop ((d 1) (c 0))
    (if (> d n) c (loop (+ d 1) (if (zero? (modulo n d)) (+ c 1) c)))))

(let loop ((n 1))
  (when (< n 60)
    (when (zero? (modulo n (tau n))) (display n) (display " "))
    (loop (+ n 1))))
(newline) ; 1 2 8 9 12 18 24 36 40 56
