#lang racket

(define (rail i k)
  (define cycle (* 2 (sub1 k)))
  (define r (modulo i cycle))
  (if (< r k) r (- cycle r)))

(define (order n k)
  (sort (range n) < #:key (lambda (i) (rail i k))))

(define (encrypt text k)
  (list->string (for/list ([i (order (string-length text) k)]) (string-ref text i))))

(define (decrypt cipher k)
  (define out (make-string (string-length cipher)))
  (for ([i (order (string-length cipher) k)] [pos (in-naturals)])
    (string-set! out i (string-ref cipher pos)))
  out)

(define c (encrypt "WEAREDISCOVERED" 3))
(printf "~a ~a\n" c (decrypt c 3))
