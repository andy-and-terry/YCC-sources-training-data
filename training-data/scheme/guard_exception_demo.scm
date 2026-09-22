;; R7RS `guard`/`raise`: condition handling without call/cc plumbing.

(define (safe-divide a b)
  (guard (e (#t (display "caught: ") (display e) (newline) 'error))
    (if (= b 0)
        (raise 'division-by-zero)
        (/ a b))))

(display (safe-divide 10 2))
(newline)
(display (safe-divide 10 0))
(newline)

(define (parse-positive n)
  (guard (e ((symbol? e) (display "rejected: ") (display e) (newline) #f))
    (if (< n 0)
        (raise 'negative-number)
        (* n n))))

(display (parse-positive 4))
(newline)
(display (parse-positive -3))
(newline)
