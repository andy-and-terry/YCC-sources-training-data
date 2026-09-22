#lang racket

;; A builder as a mutable struct threaded through chained calls,
;; finished off by a build step that snapshots an immutable result.
(struct pizza-builder (size toppings) #:mutable)

(define (make-pizza-builder)
  (pizza-builder "medium" '()))

(define (set-size! b size)
  (set-pizza-builder-size! b size)
  b)

(define (add-topping! b topping)
  (set-pizza-builder-toppings! b (cons topping (pizza-builder-toppings b)))
  b)

(struct pizza (size toppings) #:transparent)

(define (build b)
  (pizza (pizza-builder-size b) (reverse (pizza-builder-toppings b))))

(define result
  (build (add-topping! (add-topping! (set-size! (make-pizza-builder) "large") "cheese") "olives")))

(displayln result)
