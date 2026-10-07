#lang racket

;; Decorators fall out naturally as plain functions that take a
;; beverage and return a new, wrapped one -- no interface boilerplate
;; needed, unlike the class-based version of this pattern.
(struct beverage (description cost) #:transparent)

(define (make-coffee)
  (beverage "coffee" 2.0))

(define (add-milk bev)
  (beverage (string-append (beverage-description bev) ", milk")
            (+ (beverage-cost bev) 0.5)))

(define (add-sugar bev)
  (beverage (string-append (beverage-description bev) ", sugar")
            (+ (beverage-cost bev) 0.25)))

(define order (add-sugar (add-milk (make-coffee))))
(displayln (beverage-description order))
(displayln (beverage-cost order))
