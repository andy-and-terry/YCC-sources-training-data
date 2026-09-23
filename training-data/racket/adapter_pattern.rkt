#lang racket

;; The adapter pattern wraps an incompatible interface behind the one
;; the caller expects, without touching either side.

(define (make-european-socket) (lambda () 230))

(define (make-us-adapter european-socket)
  (lambda () (* (/ (european-socket) 230) 120)))

(define (power-device plug)
  (printf "device receives ~aV\n" (plug)))

(define socket (make-european-socket))
(define adapter (make-us-adapter socket))
(power-device adapter)
