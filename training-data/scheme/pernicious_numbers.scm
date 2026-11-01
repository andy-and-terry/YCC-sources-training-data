;; Pernicious numbers: the popcount is prime.
(define (prime? n)
  (and (>= n 2)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((zero? (remainder n d)) #f)
               (else (loop (+ d 1)))))))

(define (popcount n)
  (if (zero? n) 0 (+ (remainder n 2) (popcount (quotient n 2)))))

(let loop ((n 1))
  (when (<= n 20)
    (when (prime? (popcount n)) (display n) (display " "))
    (loop (+ n 1))))
(newline)
