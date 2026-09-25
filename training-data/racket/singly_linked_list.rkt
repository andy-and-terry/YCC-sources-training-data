#lang racket

(struct cell (value next) #:mutable #:transparent)

(define (list->cells lst)
  (if (null? lst)
      #f
      (cell (car lst) (list->cells (cdr lst)))))

(define (cells->list head)
  (if (not head)
      '()
      (cons (cell-value head) (cells->list (cell-next head)))))

(define (cells-length head)
  (if (not head) 0 (add1 (cells-length (cell-next head)))))

(define (cells-reverse! head)
  (let loop ([prev #f] [curr head])
    (if (not curr)
        prev
        (let ([next (cell-next curr)])
          (set-cell-next! curr prev)
          (loop curr next)))))

(define chain (list->cells '(1 2 3 4 5)))
(displayln (cells->list chain))
(displayln (cells-length chain))
(displayln (cells->list (cells-reverse! chain)))
