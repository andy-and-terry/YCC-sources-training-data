#lang racket

(define (make-prefix values)
  (list->vector (cons 0 (let loop ([vs values] [acc 0])
                          (if (null? vs)
                              '()
                              (let ([s (+ acc (car vs))])
                                (cons s (loop (cdr vs) s))))))))

(define (query prefix lo hi)
  (- (vector-ref prefix hi) (vector-ref prefix lo)))

(displayln (query (make-prefix '(3 1 4 1 5 9 2 6)) 2 5))
