#lang racket

(define (safe? queens col)
  (for/and ([i (in-range (length queens))])
    (define q (list-ref queens i))
    (define dist (- (length queens) i))
    (and (not (= q col)) (not (= (abs (- q col)) dist)))))

(define (solve queens n)
  (if (= (length queens) n)
      1
      (for/sum ([col (in-range n)])
        (if (safe? queens col)
            (solve (append queens (list col)) n)
            0))))

(displayln (solve '() 6))
