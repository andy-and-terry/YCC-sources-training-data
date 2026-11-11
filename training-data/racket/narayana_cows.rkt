#lang racket
;; Narayana's cows N(n)=N(n-1)+N(n-3)
(define (extend v)
  (define n (length v))
  (append v (list (+ (list-ref v (- n 1)) (list-ref v (- n 3))))))

(define result (for/fold ([v '(1 1 1)]) ([_ (in-range 7)]) (extend v)))
(displayln (string-join (map number->string result) " "))
