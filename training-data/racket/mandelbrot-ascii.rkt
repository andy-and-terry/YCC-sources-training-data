#lang racket
(define (escape c)
  (let loop ([z 0.0+0.0i] [n 0])
    (cond [(= n 30) 30]
          [(>= (magnitude z) 2) n]
          [else (loop (+ (* z z) c) (add1 n))])))

(for ([yi (in-range -5 6)])
  (displayln
   (list->string
    (for/list ([xi (in-range -40 13)])
      (if (= 30 (escape (make-rectangular (/ xi 20.0) (/ yi 5.0)))) #\# #\.)))))
