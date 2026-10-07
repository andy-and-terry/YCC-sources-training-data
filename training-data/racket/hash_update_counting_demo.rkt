#lang racket

(define words '("a" "b" "a" "c" "b" "a"))

(define counts
  (for/fold ([h (hash)]) ([w words])
    (hash-update h w add1 0)))

(displayln (sort (hash->list counts) string<? #:key car))

(define mutable (make-hash))
(for ([w words])
  (hash-update! mutable w add1 0))
(displayln (hash-ref mutable "a"))
(displayln (hash-ref mutable "zzz" "none"))
(displayln (hash-ref mutable "zzz" (lambda () "computed")))

(define inverted
  (for/hash ([(k v) (in-hash counts)])
    (values v k)))
(displayln (hash-ref inverted 3))
(displayln (sort (hash-keys counts) string<?))
(displayln (hash-count counts))
(displayln (hash-has-key? counts "c"))
(displayln (hash-ref (hash-set counts "d" 9) "d"))
