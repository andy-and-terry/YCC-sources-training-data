#lang racket

(require racket/stream)

(define (integers-from n)
  (stream-cons n (integers-from (add1 n))))

(define naturals (integers-from 0))

(displayln (stream->list (stream-take naturals 10)))

(define evens (stream-filter even? naturals))
(displayln (stream->list (stream-take evens 5)))

(define squares (stream-map (lambda (x) (* x x)) naturals))
(displayln (stream->list (stream-take squares 5)))
