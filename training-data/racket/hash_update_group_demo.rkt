#lang racket

(define words '("apple" "avocado" "banana" "blueberry" "cherry" "apricot"))

(define by-letter
  (for/fold ([h (hash)]) ([w (in-list words)])
    (hash-update h (string-ref w 0) (lambda (lst) (cons w lst)) '())))

(for ([k (sort (hash-keys by-letter) char<?)])
  (printf "~a: ~a\n" k (reverse (hash-ref by-letter k))))

(define counts (make-hash))
(for ([c (in-string "mississippi")])
  (hash-update! counts c add1 0))
(displayln (sort (hash->list counts) char<? #:key car))

(define h (hash 'a 1 'b 2))
(displayln (hash-set h 'c 3))
(displayln (hash-remove h 'a))
(displayln (hash-ref h 'z (lambda () 'missing)))
(displayln (hash-ref! counts #\z 0))
(displayln (hash-count counts))

(define merged (for/fold ([acc h]) ([(k v) (in-hash (hash 'b 10 'd 4))])
                 (hash-update acc k (lambda (old) (+ old v)) 0)))
(displayln (sort (hash->list merged) symbol<? #:key car))
(displayln (hash-map h (lambda (k v) (* v 10)) #t))
