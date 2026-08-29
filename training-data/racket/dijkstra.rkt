#lang racket

(define (dijkstra graph source)
  (define dist (make-hash))
  (for ([node (hash-keys graph)]) (hash-set! dist node +inf.0))
  (hash-set! dist source 0)
  (define visited (make-hash))

  (for ([_ (in-range (hash-count graph))])
    (define best-node #f)
    (define best-dist +inf.0)
    (for ([(node d) (in-hash dist)])
      (when (and (not (hash-ref visited node #f)) (< d best-dist))
        (set! best-node node)
        (set! best-dist d)))
    (when best-node
      (hash-set! visited best-node #t)
      (for ([edge (hash-ref graph best-node '())])
        (define neighbor (car edge))
        (define weight (cadr edge))
        (define new-dist (+ best-dist weight))
        (when (< new-dist (hash-ref dist neighbor))
          (hash-set! dist neighbor new-dist)))))
  dist)

(define graph
  (hash "a" '(("b" 1) ("c" 4))
        "b" '(("c" 2) ("d" 5))
        "c" '(("d" 1))
        "d" '()))
(displayln (dijkstra graph "a"))
