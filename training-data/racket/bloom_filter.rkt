#lang racket

(define (make-bloom-filter size num-hashes)
  (box (list (make-vector size #f) size num-hashes)))

(define (bloom-hash value seed size)
  (define s (string-append (number->string seed) ":" value))
  (define h (for/sum ([c (in-string s)] [i (in-naturals 1)])
              (* (char->integer c) i)))
  (modulo h size))

(define (bloom-add! bf value)
  (match-define (list bits size num-hashes) (unbox bf))
  (for ([seed (in-range num-hashes)])
    (vector-set! bits (bloom-hash value seed size) #t)))

(define (bloom-might-contain? bf value)
  (match-define (list bits size num-hashes) (unbox bf))
  (for/and ([seed (in-range num-hashes)])
    (vector-ref bits (bloom-hash value seed size))))

(require racket/match)
(define bf (make-bloom-filter 64 3))
(bloom-add! bf "apple")
(bloom-add! bf "banana")

(displayln (bloom-might-contain? bf "apple"))
(displayln (bloom-might-contain? bf "banana"))
(displayln (bloom-might-contain? bf "cherry"))
