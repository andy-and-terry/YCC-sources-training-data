#lang racket
;; Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
(define (pow-mod b e m)
  (let loop ([b (modulo b m)] [e e] [r 1])
    (cond [(zero? e) r]
          [(odd? e) (loop (modulo (* b b) m) (quotient e 2) (modulo (* r b) m))]
          [else (loop (modulo (* b b) m) (quotient e 2) r)])))

(define (prime? n)
  (and (> n 1)
       (for/and ([p (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n p))))))

(define (carmichael? n)
  (and (not (prime? n))
       (for/and ([a (in-range 2 n)])
         (or (not (= 1 (gcd a n))) (= 1 (pow-mod a (sub1 n) n))))))

(displayln (string-join (map number->string (filter carmichael? (range 3 3000 2))) " "))
