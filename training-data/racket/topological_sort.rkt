#lang racket

(define (topo-sort graph)
  (define visited (make-hash))
  (define order '())
  (define (visit node)
    (unless (hash-ref visited node #f)
      (hash-set! visited node #t)
      (for ([dep (hash-ref graph node '())])
        (visit dep))
      (set! order (cons node order))))
  (for ([node (hash-keys graph)])
    (visit node))
  order)

(define graph (hash "a" '("b" "c") "b" '("d") "c" '("d") "d" '()))
(displayln (topo-sort graph))
