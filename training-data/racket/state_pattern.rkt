#lang racket

;; The state pattern is just a pure function from one state to the
;; next -- `match` replaces the usual State subclass hierarchy.
(define (next-state state)
  (match state
    ['red 'green]
    ['green 'yellow]
    ['yellow 'red]))

(define (run-light state steps)
  (when (> steps 0)
    (displayln state)
    (run-light (next-state state) (sub1 steps))))

(run-light 'red 4)
