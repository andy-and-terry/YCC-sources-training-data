#lang racket

(define tree '(1 (2 (3 4)) ((5) 6)))
(displayln (flatten tree))

(define (depth t)
  (if (pair? t)
      (add1 (apply max 0 (map depth t)))
      0))
(displayln (depth tree))

(define (tree-map f t)
  (cond [(null? t) '()]
        [(pair? t) (cons (tree-map f (car t)) (tree-map f (cdr t)))]
        [else (f t)]))
(displayln (tree-map (lambda (x) (* x x)) tree))

(define (count-leaves t)
  (cond [(null? t) 0]
        [(not (pair? t)) 1]
        [else (+ (count-leaves (car t)) (count-leaves (cdr t)))]))
(displayln (count-leaves tree))
(displayln (remove-duplicates (flatten '(1 (1 2) (2 3)))))
