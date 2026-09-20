#lang racket

(require racket/generator)

;; A generator suspends its body at each (yield ...) call and resumes
;; from that point on the next invocation, producing values lazily
;; without building the whole sequence up front.
(define (make-fibonacci-generator)
  (generator ()
    (let loop ([a 0] [b 1])
      (yield a)
      (loop b (+ a b)))))

(define fib (make-fibonacci-generator))
(displayln (for/list ([_ (in-range 10)]) (fib)))

(define (take-while-generator gen pred)
  (let loop ([acc '()])
    (define v (gen))
    (if (pred v)
        (loop (cons v acc))
        (reverse acc))))

(define small-fibs (take-while-generator (make-fibonacci-generator) (lambda (v) (< v 50))))
(displayln small-fibs)
