#lang racket

;; dynamic-wind guarantees cleanup however control leaves the body.
(define log '())
(define (note! s) (set! log (cons s log)))

(define (with-resource body)
  (dynamic-wind
    (lambda () (note! 'open))
    body
    (lambda () (note! 'close))))

(with-resource (lambda () (note! 'work)))
(displayln (reverse log))

(set! log '())
(with-handlers ([exn:fail? (lambda (e) (note! 'handled))])
  (with-resource (lambda () (error "boom"))))
(displayln (reverse log))

(set! log '())
(let/ec escape
  (with-resource (lambda () (escape 'early) (note! 'never))))
(displayln (reverse log))
