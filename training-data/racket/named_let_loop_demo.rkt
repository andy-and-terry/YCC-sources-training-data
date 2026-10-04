#lang racket

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

(define (split-evens-odds lst)
  (let loop ([rest lst] [evens '()] [odds '()])
    (cond [(null? rest) (values (reverse evens) (reverse odds))]
          [(even? (car rest)) (loop (cdr rest) (cons (car rest) evens) odds)]
          [else (loop (cdr rest) evens (cons (car rest) odds))])))
(define-values (e o) (split-evens-odds '(1 2 3 4 5 6 7)))
(displayln (list e o))

(displayln (let loop ([i 0] [out '()])
             (if (= i 5) (reverse out) (loop (add1 i) (cons (* i i) out)))))
