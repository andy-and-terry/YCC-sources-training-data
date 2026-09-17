#lang racket

;; Strategies are ordinary first-class functions -- no interface needed.
(define (add-strategy a b) (+ a b))
(define (multiply-strategy a b) (* a b))
(define (max-strategy a b) (max a b))

(define (apply-strategy strategy a b)
  (strategy a b))

(for ([strategy (list add-strategy multiply-strategy max-strategy)])
  (displayln (apply-strategy strategy 4 7)))
