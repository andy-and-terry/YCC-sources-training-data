;; Emirps: primes whose digit reversal is a different prime.
(define (prime? n)
  (and (>= n 2)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((zero? (remainder n d)) #f)
               (else (loop (+ d 1)))))))

(define (reverse-num n)
  (let loop ((n n) (r 0))
    (if (zero? n) r (loop (quotient n 10) (+ (* r 10) (remainder n 10))))))

(do ((n 2 (+ n 1))) ((>= n 200))
  (let ((r (reverse-num n)))
    (if (and (not (= r n)) (prime? n) (prime? r))
        (begin (display n) (display " ")))))
(newline)
