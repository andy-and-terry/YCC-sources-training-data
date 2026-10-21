#lang racket
;; Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)

(define (tribonacci count)
  (let loop ([n count] [a 0] [b 0] [c 1] [acc '()])
    (if (zero? n)
        (reverse acc)
        (loop (sub1 n) b c (+ a b c) (cons a acc)))))

(printf "Tribonacci: ~a\n" (tribonacci 15))
