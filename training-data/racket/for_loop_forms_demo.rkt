#lang racket

;; Racket's `for` family has many result-producing variants beyond a
;; plain side-effecting loop; `for*` nests multiple sequences into
;; one loop, and `#:when` filters which iterations count.
(displayln (for/list ([x (in-range 5)]) (* x x)))
(displayln (for/sum ([x (in-range 1 6)]) x))
(displayln (for/product ([x (in-range 1 6)]) x))
(displayln (for/vector ([x '(1 2 3)]) (* x 10)))
(displayln (for/hash ([x '(a b c)] [i (in-naturals)]) (values x i)))

(displayln
 (for*/list ([i (in-range 1 4)] [j (in-range 1 4)] #:when (< i j))
   (list i j)))

(for ([x '(a b)] [y '(1 2)])
  (printf "~a -> ~a\n" x y))
