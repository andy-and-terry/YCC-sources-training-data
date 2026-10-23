#lang racket

;; hash-ref's third argument is either a default value or a failure thunk.
(define h (make-hash '((a . 1) (b . 2))))

(displayln (hash-ref h 'a))
(displayln (hash-ref h 'z 0))
(displayln (hash-ref h 'z (lambda () (* 6 7))))

;; A non-procedure default is returned as is; wrap procedures in a thunk.
(displayln (hash-ref h 'z (lambda () add1)))

;; Without a default a missing key raises an exception.
(displayln
 (with-handlers ([exn:fail:contract? (lambda (e) "missing key")])
   (hash-ref h 'z)))

;; hash-ref! computes and stores the value when missing (memoization).
(define cache (make-hash))
(define (slow-square n)
  (hash-ref! cache n (lambda () (printf "computing ~a\n" n) (* n n))))
(displayln (slow-square 9))
(displayln (slow-square 9))

(displayln (hash-ref (hash 'k 'v) 'k #f))
(displayln (hash-has-key? h 'b))
