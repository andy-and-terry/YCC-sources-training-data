;; Sexy primes below 100; expect 16 pairs.
(define (prime? n)
  (and (> n 1)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((zero? (modulo n d)) #f)
               (else (loop (+ d 1)))))))

(define (count-range lo hi pred)
  (let loop ((i lo) (c 0))
    (if (>= i hi) c (loop (+ i 1) (if (pred i) (+ c 1) c)))))

(display (count-range 2 100 (lambda (p) (and (prime? p) (prime? (+ p 6))))))
(newline)
