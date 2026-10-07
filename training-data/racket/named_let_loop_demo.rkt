#lang racket

;; Named let: a local recursive function invoked immediately.
(define (sum-to n)
  (let loop ([i 1] [acc 0])
    (if (> i n)
        acc
        (loop (add1 i) (+ acc i)))))
(displayln (sum-to 100))

(define (digits n)
  (let loop ([n n] [acc '()])
    (if (< n 10)
        (cons n acc)
        (loop (quotient n 10) (cons (remainder n 10) acc)))))
(displayln (digits 90210))

(define (collatz-steps n)
  (let loop ([n n] [steps 0])
    (cond [(= n 1) steps]
          [(even? n) (loop (/ n 2) (add1 steps))]
          [else (loop (+ (* 3 n) 1) (add1 steps))])))
(displayln (collatz-steps 27))
