#lang racket
(require racket/stream)
(define nat (let loop ([n 0]) (stream-cons n (loop (add1 n)))))
(displayln (stream->list (stream-take nat 5)))
