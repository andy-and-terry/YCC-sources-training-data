#lang racket

;; A mixin is a function from a class to a subclass, built with `mixin`.
(define animal%
  (class object%
    (super-new)
    (define/public (speak) "...")))

(define loud-mixin
  (mixin () ()
    (super-new)
    (define/override (speak)
      (string-upcase (super speak)))))

(define dog%
  (class animal%
    (super-new)
    (define/override (speak) "woof")))

(define loud-dog% (loud-mixin dog%))
(define loud-animal% (loud-mixin animal%))

(displayln (send (new dog%) speak))
(displayln (send (new loud-dog%) speak))
(displayln (send (new loud-animal%) speak))
(displayln (is-a? (new loud-dog%) dog%))
