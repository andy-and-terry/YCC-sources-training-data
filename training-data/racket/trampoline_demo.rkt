#lang racket

;; A trampoline runs thunks in a loop so mutual recursion uses constant stack.
(define (trampoline result)
  (if (procedure? result)
      (trampoline (result))
      result))

(define (my-even? n)
  (if (zero? n) #t (lambda () (my-odd? (- n 1)))))

(define (my-odd? n)
  (if (zero? n) #f (lambda () (my-even? (- n 1)))))

(displayln (trampoline (my-even? 10)))
(displayln (trampoline (my-odd? 100001)))

(define (sum-to n acc)
  (if (zero? n) acc (lambda () (sum-to (- n 1) (+ acc n)))))
(displayln (trampoline (sum-to 1000000 0)))
