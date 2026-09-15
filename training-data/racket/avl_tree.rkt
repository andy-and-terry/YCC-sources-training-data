#lang racket

(struct node (value left right height) #:transparent)

(define (h n) (if n (node-height n) 0))

(define (make-leaf v) (node v #f #f 1))

(define (update-height n)
  (node (node-value n) (node-left n) (node-right n)
        (+ 1 (max (h (node-left n)) (h (node-right n))))))

(define (balance-factor n)
  (- (h (node-left n)) (h (node-right n))))

(define (rotate-right n)
  (define l (node-left n))
  (define new-n (update-height (node (node-value n) (node-right l) (node-right n) 0)))
  (update-height (node (node-value l) (node-left l) new-n 0)))

(define (rotate-left n)
  (define r (node-right n))
  (define new-n (update-height (node (node-value n) (node-left n) (node-left r) 0)))
  (update-height (node (node-value r) new-n (node-right r) 0)))

(define (rebalance n0)
  (define n (update-height n0))
  (define bf (balance-factor n))
  (cond
    [(> bf 1)
     (if (< (balance-factor (node-left n)) 0)
         (rotate-right (node (node-value n) (rotate-left (node-left n)) (node-right n) 0))
         (rotate-right n))]
    [(< bf -1)
     (if (> (balance-factor (node-right n)) 0)
         (rotate-left (node (node-value n) (node-left n) (rotate-right (node-right n)) 0))
         (rotate-left n))]
    [else n]))

(define (avl-insert n v)
  (cond
    [(not n) (make-leaf v)]
    [(< v (node-value n)) (rebalance (node (node-value n) (avl-insert (node-left n) v) (node-right n) 0))]
    [(> v (node-value n)) (rebalance (node (node-value n) (node-left n) (avl-insert (node-right n) v) 0))]
    [else n]))

(define (inorder n)
  (if (not n)
      '()
      (append (inorder (node-left n)) (list (node-value n)) (inorder (node-right n)))))

(define tree (foldl (lambda (v acc) (avl-insert acc v)) #f '(10 20 30 40 50 25)))

(displayln (inorder tree))
(displayln (h tree))
