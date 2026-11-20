;; Wilson's theorem primality test.
(define (wilson? n)
  (and (>= n 2)
       (let loop ((i 2) (f 1))
         (if (>= i n) (= f (- n 1)) (loop (+ i 1) (remainder (* f i) n))))))
(let loop ((n 2))
  (when (< n 20) (when (wilson? n) (display n) (display " ")) (loop (+ n 1))))
(newline)
