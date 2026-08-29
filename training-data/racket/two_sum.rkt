#lang racket

(define (two-sum nums target)
  (define seen (make-hash))
  (let loop ([lst nums] [i 0])
    (cond
      [(null? lst) #f]
      [else
       (define complement (- target (car lst)))
       (if (hash-has-key? seen complement)
           (list (hash-ref seen complement) i)
           (begin
             (hash-set! seen (car lst) i)
             (loop (cdr lst) (add1 i))))])))

(displayln (two-sum '(2 7 11 15) 9))
