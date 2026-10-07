#lang racket

;; A struct can extend a parent struct, inheriting its fields and
;; adding its own; instances still satisfy the parent's predicate and
;; work with the parent's accessors.
(struct shape (name) #:transparent)
(struct circle shape (radius) #:transparent)
(struct rectangle shape (width height) #:transparent)

(define (area s)
  (cond
    [(circle? s) (* pi (sqr (circle-radius s)))]
    [(rectangle? s) (* (rectangle-width s) (rectangle-height s))]
    [else (error "unknown shape")]))

(define c (circle "circle" 3))
(define r (rectangle "rectangle" 4 5))

(displayln (shape? c))
(displayln (shape-name c))
(displayln (area c))
(displayln (area r))
