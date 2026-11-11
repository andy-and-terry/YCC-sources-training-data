#lang racket
;; Fermat primality test; Carmichael number 561 fools it.
(define (powmod b e m)
  (let loop ([b (modulo b m)] [e e] [r 1])
    (cond [(zero? e) r]
          [(odd? e) (loop (modulo (* b b) m) (quotient e 2) (modulo (* r b) m))]
          [else (loop (modulo (* b b) m) (quotient e 2) r)])))

(define (probably-prime? n)
  (and (> n 2) (= (powmod 2 (- n 1) n) 1)))

(for ([n '(97 91 561)])
  (printf "~a ~a\n" n (probably-prime? n)))
