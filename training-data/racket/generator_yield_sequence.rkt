#lang racket
(require racket/generator)
(define g (generator () (for ([i 3]) (yield i)) 'done))
(displayln (list (g) (g) (g) (g)))
