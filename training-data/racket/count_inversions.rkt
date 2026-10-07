#lang racket

;; Returns (values sorted-list inversion-count) via merge sort.
(define (count-inv lst)
  (if (<= (length lst) 1)
      (values lst 0)
      (let-values ([(l r) (split-at lst (quotient (length lst) 2))])
        (let-values ([(sl a) (count-inv l)]
                     [(sr b) (count-inv r)])
          (let loop ([x sl] [y sr] [acc '()] [cross 0])
            (cond [(null? x) (values (append (reverse acc) y) (+ a b cross))]
                  [(null? y) (values (append (reverse acc) x) (+ a b cross))]
                  [(<= (car x) (car y))
                   (loop (cdr x) y (cons (car x) acc) cross)]
                  [else
                   (loop x (cdr y) (cons (car y) acc) (+ cross (length x)))]))))))

(define-values (_s1 n1) (count-inv '(2 4 1 3 5)))
(define-values (_s2 n2) (count-inv '(5 4 3 2 1)))
(displayln n1) ; 3
(displayln n2) ; 10
