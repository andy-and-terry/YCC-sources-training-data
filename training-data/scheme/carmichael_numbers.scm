;; Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
(define (pow-mod b e m)
  (let loop ((b (modulo b m)) (e e) (r 1))
    (cond ((= e 0) r)
          ((odd? e) (loop (modulo (* b b) m) (quotient e 2) (modulo (* r b) m)))
          (else (loop (modulo (* b b) m) (quotient e 2) r)))))

(define (prime? n)
  (and (> n 1)
       (let loop ((p 2))
         (cond ((> (* p p) n) #t)
               ((zero? (modulo n p)) #f)
               (else (loop (+ p 1)))))))

(define (carmichael? n)
  (and (not (prime? n))
       (let loop ((a 2))
         (cond ((>= a n) #t)
               ((and (= 1 (gcd a n)) (not (= 1 (pow-mod a (- n 1) n)))) #f)
               (else (loop (+ a 1)))))))

(do ((n 3 (+ n 2))) ((>= n 3000))
  (if (carmichael? n) (begin (display n) (display " "))))
(newline)
