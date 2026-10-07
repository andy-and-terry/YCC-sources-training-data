;; Prime factorization by trial division
(define (factorize n)
  (let loop ((n n) (d 2) (acc '()))
    (cond ((= n 1) (reverse acc))
          ((> (* d d) n) (reverse (cons n acc)))
          ((= 0 (remainder n d)) (loop (quotient n d) d (cons d acc)))
          (else (loop n (+ d 1) acc)))))

(display (factorize 360)) (newline)
(display (factorize 97)) (newline)
(display (factorize 600851475143)) (newline)
