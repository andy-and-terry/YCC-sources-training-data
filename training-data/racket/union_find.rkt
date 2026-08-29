#lang racket

(define (make-union-find n)
  (build-vector n identity))

(define (uf-find parent x)
  (if (= (vector-ref parent x) x)
      x
      (uf-find parent (vector-ref parent x))))

(define (uf-union! parent x y)
  (define root-x (uf-find parent x))
  (define root-y (uf-find parent y))
  (unless (= root-x root-y)
    (vector-set! parent root-x root-y)))

(define parent (make-union-find 5))
(uf-union! parent 0 1)
(uf-union! parent 1 2)
(displayln (= (uf-find parent 0) (uf-find parent 2)))
(displayln (= (uf-find parent 0) (uf-find parent 3)))
