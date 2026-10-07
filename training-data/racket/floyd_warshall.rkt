#lang racket

;; All-pairs shortest paths: try every node k as an intermediate hop
;; between every pair (i, j), keeping whichever route is cheaper.
(define (floyd-warshall graph)
  (define nodes (hash-keys graph))
  (define dist (make-hash))

  (for* ([i nodes] [j nodes])
    (hash-set! dist (cons i j)
               (cond
                 [(equal? i j) 0]
                 [(assoc j (hash-ref graph i '())) => cadr]
                 [else +inf.0])))

  (for* ([k nodes] [i nodes] [j nodes])
    (define via-k (+ (hash-ref dist (cons i k)) (hash-ref dist (cons k j))))
    (when (< via-k (hash-ref dist (cons i j)))
      (hash-set! dist (cons i j) via-k)))

  dist)

(define graph
  (hash "a" '(("b" 3) ("c" 8))
        "b" '(("c" -2) ("d" 1))
        "c" '()
        "d" '(("a" 2) ("c" -5))))

(define dist (floyd-warshall graph))
(for* ([i (sort (hash-keys graph) string<?)]
       [j (sort (hash-keys graph) string<?)])
  (printf "~a -> ~a: ~a\n" i j (hash-ref dist (cons i j))))
