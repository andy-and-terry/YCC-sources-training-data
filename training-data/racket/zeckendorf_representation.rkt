#lang racket

;; Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
(define (fibs-up-to n)
  (let loop ([a 1] [b 2] [acc '()])
    (if (> a n)
        acc
        (loop b (+ a b) (cons a acc)))))

(define (zeckendorf n)
  (let loop ([fs (fibs-up-to n)] [rest n] [acc '()])
    (cond [(null? fs) (reverse acc)]
          [(<= (car fs) rest) (loop (cdr fs) (- rest (car fs)) (cons (car fs) acc))]
          [else (loop (cdr fs) rest acc)])))

(displayln (string-join (map number->string (zeckendorf 100)) " "))
