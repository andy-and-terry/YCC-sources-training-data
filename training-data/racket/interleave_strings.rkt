#lang racket

(define (interleave . strs)
  (define longest (apply max (map string-length strs)))
  (list->string
   (for*/list ([i (in-range longest)]
               [s (in-list strs)]
               #:when (< i (string-length s)))
     (string-ref s i))))

(displayln (interleave "abc" "12345"))
(displayln (interleave "ab" "cd" "efg"))
