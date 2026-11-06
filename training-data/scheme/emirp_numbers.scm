;; Emirps: primes whose digit reversal is a different prime.
(define (prime? n)
  (and (>= n 2)
       (let loop ((i 2))
         (cond ((> (* i i) n) #t)
               ((zero? (remainder n i)) #f)
               (else (loop (+ i 1)))))))

(define (rev n)
  (let loop ((n n) (acc 0))
    (if (zero? n)
        acc
        (loop (quotient n 10) (+ (* acc 10) (remainder n 10))))))

(do ((n 2 (+ n 1))) ((>= n 100))
  (let ((r (rev n)))
    (if (and (not (= r n)) (prime? n) (prime? r))
        (begin (display n) (display " ")))))
(newline)
