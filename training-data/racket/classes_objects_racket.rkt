#lang racket
(define animal%
  (class object%
    (init-field name)
    (super-new)
    (define/public (speak) (format "~a makes a sound" name))
    (define/public (get-name) name)))

(define dog%
  (class animal%
    (super-new)
    (inherit-field name)
    (define count 0)
    (define/override (speak) (set! count (add1 count)) (format "~a barks (~a)" name count))))

(define d (new dog% [name "Rex"]))
(displayln (send d speak))
(displayln (send d speak))
(displayln (send (new animal% [name "Generic"]) speak))
(displayln (is-a? d animal%))
(displayln (send d get-name))
