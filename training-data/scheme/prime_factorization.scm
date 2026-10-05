;; Trial-division prime factorization.

(define (prime-factors n)
  (let loop ((n n) (d 2) (acc '()))
    (cond ((< n 2) (reverse acc))
          ((> (* d d) n) (reverse (cons n acc)))
          ((= 0 (remainder n d)) (loop (quotient n d) d (cons d acc)))
          (else (loop n (+ d 1) acc)))))

(define (join-with sep items)
  (if (null? (cdr items))
      (number->string (car items))
      (string-append (number->string (car items)) sep (join-with sep (cdr items)))))

(display (prime-factors 360)) (newline)
(display (prime-factors 97)) (newline)
(display (join-with " x " (prime-factors 1001))) (newline)
