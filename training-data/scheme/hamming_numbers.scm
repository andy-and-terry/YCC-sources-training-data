;; Hamming numbers (5-smooth): only prime factors 2, 3 and 5
(define (strip n p)
  (if (= 0 (remainder n p)) (strip (quotient n p) p) n))

(define (hamming? n)
  (= 1 (strip (strip (strip n 2) 3) 5)))

(let loop ((n 1) (count 0))
  (if (< count 20)
      (if (hamming? n)
          (begin (display n) (display " ") (loop (+ n 1) (+ count 1)))
          (loop (+ n 1) count))))
(newline)
