#lang racket

(define people '(("Cy" 30) ("Ann" 25) ("Bob" 30) ("Dee" 22)))

(displayln (sort '(5 2 9 1) <))
(displayln (sort '("pear" "fig" "banana") string<?))
(displayln (sort people < #:key cadr))
(displayln (sort people string<? #:key car))
(displayln (sort people > #:key cadr))
(displayln (sort '("bb" "a" "ccc") < #:key string-length))

(define expensive-calls 0)
(define (score s) (set! expensive-calls (add1 expensive-calls)) (string-length s))
(displayln (sort '("aaa" "b" "cc" "dddd") < #:key score #:cache-keys? #t))
(displayln expensive-calls)

(define (multi-key-less a b)
  (or (> (cadr a) (cadr b))
      (and (= (cadr a) (cadr b)) (string<? (car a) (car b)))))
(displayln (sort people multi-key-less))

(define v (vector 4 2 7 1))
(vector-sort! v <)
(displayln v)
(displayln (vector-sort #(3 1 2) >))

(displayln (argmin cadr people))
(displayln (argmax cadr people))
(displayln (remove-duplicates (map cadr people)))
(displayln (sort (remove-duplicates '(3 1 3 2 1)) <))
