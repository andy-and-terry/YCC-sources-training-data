;; Aliquot sequence: replace n by the sum of its proper divisors.
(define (aliquot-sum n)
  (let loop ((d 1) (s 0))
    (cond ((> d (quotient n 2)) s)
          ((= 0 (remainder n d)) (loop (+ d 1) (+ s d)))
          (else (loop (+ d 1) s)))))

(let loop ((n 12) (count 0))
  (display n) (display " ")
  (if (and (> n 1) (< count 19))
      (loop (aliquot-sum n) (+ count 1))))
(newline)
