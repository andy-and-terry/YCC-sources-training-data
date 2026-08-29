(define (edit-distance a b)
  (define (helper i j)
    (cond
      ((= i 0) j)
      ((= j 0) i)
      ((char=? (string-ref a (- i 1)) (string-ref b (- j 1))) (helper (- i 1) (- j 1)))
      (else (+ 1 (min (helper (- i 1) j) (helper i (- j 1)) (helper (- i 1) (- j 1)))))))
  (helper (string-length a) (string-length b)))

(display (edit-distance "kitten" "sitting"))
(newline)
