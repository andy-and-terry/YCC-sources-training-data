#lang racket

(define (rod-cutting prices length)
  (define memo (make-hash))
  (define (best n)
    (cond
      [(= n 0) 0]
      [(hash-has-key? memo n) (hash-ref memo n)]
      [else
       (define result
         (apply max (for/list ([i (in-range 1 (add1 n))])
                       (+ (list-ref prices (sub1 i)) (best (- n i))))))
       (hash-set! memo n result)
       result]))
  (best length))

(displayln (rod-cutting '(1 5 8 9 10 17 17 20) 8))
(displayln (rod-cutting '(1 5 8 9 10 17 17 20) 4))
