#lang racket

;; racket/class: message-passing OOP with fields, methods, and inheritance.

(require racket/class)

(define animal%
  (class object%
    (init-field name)
    (super-new)
    (define/public (speak) "...")
    (define/public (describe) (format "~a says ~a" name (send this speak)))))

(define dog%
  (class animal%
    (super-new)
    (define/override (speak) "Woof")))

(define cat%
  (class animal%
    (super-new)
    (define/override (speak) "Meow")))

(define fido (new dog% [name "Fido"]))
(define whiskers (new cat% [name "Whiskers"]))

(displayln (send fido describe))
(displayln (send whiskers describe))
(displayln (is-a? fido animal%))
