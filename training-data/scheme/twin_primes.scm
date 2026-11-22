;; Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
(define (prime? n)
  (and (>= n 2)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((zero? (remainder n d)) #f)
               (else (loop (+ d 1)))))))

(do ((p 2 (+ p 1))) ((>= p 100))
  (if (and (prime? p) (prime? (+ p 2)))
      (begin (display p) (display " "))))
(newline)
