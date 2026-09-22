#lang racket

(require racket/generic)

;; define-generics declares an interface (gen:shape) plus a
;; predicate (shape?); any struct that implements its methods can
;; then be used polymorphically through that interface.
(define-generics shape
  (shape-area shape)
  (shape-name shape))

(struct circle (radius)
  #:methods gen:shape
  [(define (shape-area c) (* pi (sqr (circle-radius c))))
   (define (shape-name c) "circle")])

(struct rectangle (width height)
  #:methods gen:shape
  [(define (shape-area r) (* (rectangle-width r) (rectangle-height r)))
   (define (shape-name r) "rectangle")])

(define (describe s)
  (format "~a has area ~a" (shape-name s) (real->decimal-string (shape-area s) 2)))

(for ([s (list (circle 2) (rectangle 3 4))])
  (displayln (describe s)))

(displayln (shape? (circle 1)))
(displayln (shape? "not a shape"))
