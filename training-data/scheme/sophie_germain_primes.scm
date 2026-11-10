(define (prime? n)
  (and (>= n 2)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((zero? (modulo n d)) #f)
               (else (loop (+ d 1)))))))

(define (collect p left acc)
  (cond ((zero? left) (reverse acc))
        ((and (prime? p) (prime? (+ (* 2 p) 1))) (collect (+ p 1) (- left 1) (cons p acc)))
        (else (collect (+ p 1) left acc))))

(display (collect 2 10 '())) (newline) ; (2 3 5 11 23 29 41 53 83 89)
