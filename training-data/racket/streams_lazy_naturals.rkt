#lang racket
(require racket/stream)
(define nat (stream-cons 0 (stream-map add1 nat)))
(displayln (stream->list (stream-take nat 5)))
