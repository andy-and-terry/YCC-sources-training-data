;; Emirps below 200; expect 15.
(define (prime? n)
  (and (> n 1)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((zero? (modulo n d)) #f)
               (else (loop (+ d 1)))))))

(define (count-range lo hi pred)
  (let loop ((i lo) (c 0))
    (if (>= i hi) c (loop (+ i 1) (if (pred i) (+ c 1) c)))))

(define (rev n)
  (let loop ((n n) (r 0))
    (if (zero? n) r (loop (quotient n 10) (+ (* r 10) (remainder n 10))))))
(display (count-range 2 200 (lambda (n) (and (not (= (rev n) n)) (prime? n) (prime? (rev n))))))
(newline)
