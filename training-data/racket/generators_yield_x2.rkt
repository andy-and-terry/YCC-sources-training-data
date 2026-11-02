#lang racket
(require racket/generator)
(define g (generator () (for ([i 3]) (yield (* i 10)))))
(displayln (list (g) (g) (g)))
