#lang racket

;; State: behavior dispatched off a mutable "state" field on a struct
;; rather than a chain of if/else on a status flag.

(struct traffic-light (state) #:mutable #:transparent)

(define (next-state! light)
  (set-traffic-light-state!
   light
   (match (traffic-light-state light)
     ['red 'green]
     ['green 'yellow]
     ['yellow 'red])))

(require racket/match)

(define light (traffic-light 'red))
(for ([_ (in-range 4)])
  (displayln (traffic-light-state light))
  (next-state! light))
