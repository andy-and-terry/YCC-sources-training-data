#lang racket
;; Perrin sequence P(n)=P(n-2)+P(n-3)
(define (extend v)
  (define n (length v))
  (append v (list (+ (list-ref v (- n 2)) (list-ref v (- n 3))))))

(define result (for/fold ([v '(3 0 2)]) ([_ (in-range 7)]) (extend v)))
(displayln (string-join (map number->string result) " "))
