#lang racket

;; Bellman-Ford: relax every edge |V|-1 times, tolerating negative
;; weights (unlike Dijkstra); one more relaxation pass that still
;; improves a distance means a reachable negative-weight cycle exists.

(define (bellman-ford edges nodes source)
  (define dist (make-hash))
  (for ([n nodes]) (hash-set! dist n +inf.0))
  (hash-set! dist source 0)

  (for ([_ (in-range (sub1 (length nodes)))])
    (for ([edge edges])
      (match-define (list u v w) edge)
      (when (< (+ (hash-ref dist u) w) (hash-ref dist v))
        (hash-set! dist v (+ (hash-ref dist u) w)))))

  (define negative-cycle?
    (for/or ([edge edges])
      (match-define (list u v w) edge)
      (< (+ (hash-ref dist u) w) (hash-ref dist v))))

  (values dist negative-cycle?))

(require racket/match)

(define edges '((a b 4) (a c 5) (b c -3) (c d 4)))
(define-values (dist has-cycle) (bellman-ford edges '(a b c d) 'a))
(displayln dist)
(displayln has-cycle)
