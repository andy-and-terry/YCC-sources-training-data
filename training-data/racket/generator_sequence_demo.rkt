#lang racket
(require racket/generator)

(define g
  (generator ()
    (for ([i (in-range 3)])
      (yield (* i 10)))
    'done))

(displayln (g))
(displayln (g))
(displayln (g))
(displayln (g))

(define (naturals)
  (in-generator
    (let loop ([n 0])
      (yield n)
      (loop (add1 n)))))

(displayln (for/list ([n (naturals)] [_ 4]) n))
