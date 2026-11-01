;; Sum of prime factors counted with multiplicity.
(define (sopfr n)
  (let loop ((n n) (p 2) (total 0))
    (cond ((= n 1) total)
          ((> (* p p) n) (+ total n))
          ((zero? (remainder n p)) (loop (quotient n p) p (+ total p)))
          (else (loop n (+ p 1) total)))))

(let loop ((n 2))
  (when (< n 110)
    (when (= (sopfr n) (sopfr (+ n 1))) (display n) (display " "))
    (loop (+ n 1))))
(newline)
