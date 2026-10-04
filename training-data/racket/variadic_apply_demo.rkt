#lang racket

(define (sum . nums) (apply + nums))
(displayln (sum))
(displayln (sum 1 2 3))

(define (log-message level . parts)
  (printf "[~a] ~a\n" level (string-join (map ~a parts) " ")))
(log-message 'info "user" 42 'logged-in)

(define (average first . rest)
  (/ (apply + first rest) (add1 (length rest))))
(displayln (average 2 4 6))

(define args '(10 20 30))
(displayln (apply max args))
(displayln (apply max 5 args))

(define plus-or-times
  (case-lambda
    [() 0]
    [(x) x]
    [(x y) (+ x y)]
    [(x . more) (apply * x more)]))
(displayln (list (plus-or-times) (plus-or-times 4) (plus-or-times 1 2) (plus-or-times 2 3 4)))
