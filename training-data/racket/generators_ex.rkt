#lang racket
(require racket/generator)
(define g (generator ()
  (for ([i (in-range 3)]) (yield i))
  'done))
(displayln (list (g) (g) (g) (g)))
