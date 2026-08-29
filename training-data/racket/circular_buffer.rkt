#lang racket

(define (make-circular-buffer capacity)
  (box (list (make-vector capacity 0) capacity 0 0)))

(define (cb-push! buf value)
  (match-define (list data capacity size start) (unbox buf))
  (define index (modulo (+ start size) capacity))
  (vector-set! data index value)
  (if (< size capacity)
      (set-box! buf (list data capacity (add1 size) start))
      (set-box! buf (list data capacity size (modulo (add1 start) capacity)))))

(require racket/match)
(define buf (make-circular-buffer 3))
(for ([v '(1 2 3 4 5)]) (cb-push! buf v))
(displayln (unbox buf))
