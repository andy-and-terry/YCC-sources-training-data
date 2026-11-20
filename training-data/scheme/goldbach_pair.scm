;; Goldbach pair.
(define (prime? n)
  (and (> n 1) (let loop ((d 2)) (cond ((> (* d d) n) #t) ((zero? (remainder n d)) #f) (else (loop (+ d 1)))))))
(define (goldbach n)
  (let loop ((p 2))
    (cond ((> p (quotient n 2)) #f)
          ((and (prime? p) (prime? (- n p))) (cons p (- n p)))
          (else (loop (+ p 1))))))
(display (goldbach 28)) (newline)
