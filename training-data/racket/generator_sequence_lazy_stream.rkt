#lang racket
(require racket/generator)
(define g (generator () (for ([i (in-range 3)]) (yield (* i 10)))))
(displayln (list (g) (g) (g)))
(define s (stream-cons 1 (stream-map add1 s)))
(displayln (stream->list (stream-take s 4)))
