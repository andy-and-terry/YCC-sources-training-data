#lang racket

(struct point (x y) #:transparent)

(define describe
  (match-lambda
    [(point 0 0) "origin"]
    [(point x 0) (format "on x-axis at ~a" x)]
    [(point 0 y) (format "on y-axis at ~a" y)]
    [(point x y) #:when (= x y) "on the diagonal"]
    [_ "somewhere else"]))

(for ([p (list (point 0 0) (point 3 0) (point 0 4) (point 2 2) (point 1 5))])
  (displayln (describe p)))

(define (sum-pairs lst)
  (map (match-lambda [(cons a b) (+ a b)]) lst))
(displayln (sum-pairs '((1 . 2) (3 . 4))))

(match-define (list a (list b c) ...) '(1 (2 3) (4 5)))
(displayln (list a b c))

(define/match (head-or-default lst default)
  [('() d) d]
  [((cons h _) _) h])
(displayln (head-or-default '() 'none))
(displayln (head-or-default '(7 8) 'none))
