#lang racket

;; case-lambda picks a clause by the number of arguments.

(define area
  (case-lambda
    [(side) (* side side)]
    [(w h) (* w h)]
    [(a b c) (let ([s (/ (+ a b c) 2)])
               (sqrt (* s (- s a) (- s b) (- s c))))]))

(displayln (area 4))
(displayln (area 3 5))
(displayln (area 3 4 5))

;; Optional argument plus rest arguments.
(define join
  (case-lambda
    [() ""]
    [(a) a]
    [(a . more) (string-append a "," (apply join more))]))

(displayln (join))
(displayln (join "x"))
(displayln (join "x" "y" "z"))

(displayln (procedure-arity area))

(with-handlers ([exn:fail:contract:arity?
                 (lambda (e) (displayln "wrong number of arguments"))])
  (area 1 2 3 4))
