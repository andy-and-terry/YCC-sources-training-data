#lang racket

(define (collatz-step n)
  (if (even? n) (quotient n 2) (+ (* 3 n) 1)))

(define (collatz n)
  (let loop ([n n] [acc '()])
    (if (= n 1)
        (reverse (cons 1 acc))
        (loop (collatz-step n) (cons n acc)))))

(displayln (collatz 6))
(displayln (length (collatz 27)))

(define-values (best-n best-len)
  (for/fold ([best 1] [len 1]) ([n (in-range 1 1000)])
    (define l (length (collatz n)))
    (if (> l len) (values n l) (values best len))))
(printf "longest under 1000: ~a (~a steps)\n" best-n best-len)
