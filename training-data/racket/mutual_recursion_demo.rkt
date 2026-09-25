#lang racket

;; Two functions can call each other before either one's definition
;; is finished, because top-level `define`s resolve names lazily --
;; this is mutual recursion.
(define (my-even? n)
  (if (zero? n) #t (my-odd? (sub1 n))))

(define (my-odd? n)
  (if (zero? n) #f (my-even? (sub1 n))))

(displayln (my-even? 10))
(displayln (my-odd? 7))

;; A ping-pong pair that also accumulates a trace of the calls made.
(define (ping n trace)
  (if (<= n 0) (reverse trace) (pong (sub1 n) (cons 'ping trace))))

(define (pong n trace)
  (if (<= n 0) (reverse trace) (ping (sub1 n) (cons 'pong trace))))

(displayln (ping 6 '()))
