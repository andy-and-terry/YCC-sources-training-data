#lang racket

(define (count-words words)
  (for/fold ([h (hash)]) ([w (in-list words)])
    (hash-update h w add1 0)))

(define counts (count-words '("a" "b" "a" "c" "a" "b")))
(displayln (sort (hash->list counts) string<? #:key car))

(define groups
  (for/fold ([h (hash)]) ([w '("apple" "avocado" "banana" "blueberry" "cherry")])
    (hash-update h (string-ref w 0) (lambda (l) (cons w l)) '())))
(displayln (hash-ref groups #\a))

(define m (make-hash))
(hash-set! m 'x 1)
(hash-update! m 'x add1)
(hash-ref! m 'y (lambda () 100))
(displayln (sort (hash->list m) symbol<? #:key car))
(displayln (hash-ref m 'z "missing"))
(hash-remove! m 'x)
(displayln (hash-count m))
