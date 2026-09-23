#lang racket

;; Each handler either deals with the request or passes it along to
;; the next handler in the chain. Handlers here are just functions
;; that take the amount and the "rest of the chain" as a thunk.

(define (small-note-dispenser amount next)
  (if (<= amount 20)
      (printf "dispensing ~a using $20 or smaller notes\n" amount)
      (next amount)))

(define (large-note-dispenser amount next)
  (if (<= amount 100)
      (printf "dispensing ~a using $100 notes\n" amount)
      (next amount)))

(define (no-handler amount)
  (printf "no handler could process ~a\n" amount))

(define (make-chain . handlers)
  (foldr (lambda (handler next) (lambda (amount) (handler amount next)))
         no-handler
         handlers))

(define dispense (make-chain small-note-dispenser large-note-dispenser))

(dispense 20)
(dispense 80)
(dispense 500)
