#lang racket

;; #:break stops before running the body for that element;
;; #:final runs the body for that element and then stops.

(displayln
 (for/list ([n (in-naturals 1)]
            #:break (> n 5))
   (* n n)))

(displayln
 (for/list ([n (in-naturals 1)]
            #:final (> n 5))
   (* n n)))

;; Find the first element satisfying a condition with for/first.
(displayln (for/first ([x '(3 8 11 20)] #:when (even? x)) x))

;; #:break inside the body clauses of a nested loop
(for ([i 3])
  (for ([j 3]
        #:break (= j i))
    (printf "(~a,~a) " i j))
  (newline))

;; for/or and for/and short-circuit
(displayln (for/or ([x '(1 3 4 5)]) (and (even? x) x)))
(displayln (for/and ([x '(2 4 6)]) (even? x)))
