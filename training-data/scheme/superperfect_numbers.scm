(define (sigma n)
  (let loop ((d 1) (s 0))
    (if (> d n) s (loop (+ d 1) (if (zero? (modulo n d)) (+ s d) s)))))

(let loop ((n 1))
  (when (< n 100)
    (when (= (sigma (sigma n)) (* 2 n)) (display n) (display " "))
    (loop (+ n 1))))
(newline) ; 2 4 16 64
