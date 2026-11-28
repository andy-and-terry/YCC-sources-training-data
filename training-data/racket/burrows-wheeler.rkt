#lang racket
(define (bwt s)
  (define n (string-length s))
  (define rots
    (for/list ([i (in-range n)])
      (string-append (substring s i) (substring s 0 i))))
  (list->string
   (for/list ([r (sort rots string<?)])
     (string-ref r (sub1 n)))))

(displayln (bwt "banana$"))
