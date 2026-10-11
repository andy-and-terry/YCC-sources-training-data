#lang racket

;; Non-tail recursion builds up continuation frames; tail recursion does not.
(define (sum-nontail n)
  (if (= n 0) 0 (+ n (sum-nontail (sub1 n)))))

(define (sum-tail n [acc 0])
  (if (= n 0) acc (sum-tail (sub1 n) (+ acc n))))

(displayln (sum-nontail 10000))
(displayln (sum-tail 10000))
;; Racket has no fixed stack limit, so even a deep non-tail call works.
(displayln (sum-nontail 1000000))
(displayln (sum-tail 5000000))

(define (count-down n)
  (cond [(zero? n) 'done]
        [else (count-down (sub1 n))]))
(displayln (count-down 1000000))

;; and/or/cond/when in tail position preserve tail calls
(define (all-pos? lst)
  (or (null? lst) (and (positive? (car lst)) (all-pos? (cdr lst)))))
(displayln (all-pos? (range 1 100000)))
