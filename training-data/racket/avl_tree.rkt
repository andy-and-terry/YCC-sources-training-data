#lang racket

(struct node (key left right height) #:transparent)

(define (height n)
  (if n (node-height n) 0))

(define (make-node key left right)
  (node key left right (+ 1 (max (height left) (height right)))))

(define (balance-factor n)
  (if n (- (height (node-left n)) (height (node-right n))) 0))

(define (rotate-right y)
  (define x (node-left y))
  (make-node (node-key x) (node-left x)
             (make-node (node-key y) (node-right x) (node-right y))))

(define (rotate-left x)
  (define y (node-right x))
  (make-node (node-key y)
             (make-node (node-key x) (node-left x) (node-left y))
             (node-right y)))

(define (avl-insert n key)
  (cond
    [(not n) (make-node key #f #f)]
    [(< key (node-key n))
     (define new-left (avl-insert (node-left n) key))
     (define balanced (make-node (node-key n) new-left (node-right n)))
     (rebalance balanced key)]
    [(> key (node-key n))
     (define new-right (avl-insert (node-right n) key))
     (define balanced (make-node (node-key n) (node-left n) new-right))
     (rebalance balanced key)]
    [else n]))

(define (rebalance n key)
  (define bf (balance-factor n))
  (cond
    [(and (> bf 1) (< key (node-key (node-left n))))
     (rotate-right n)]
    [(and (< bf -1) (> key (node-key (node-right n))))
     (rotate-left n)]
    [(and (> bf 1) (> key (node-key (node-left n))))
     (rotate-right (make-node (node-key n) (rotate-left (node-left n)) (node-right n)))]
    [(and (< bf -1) (< key (node-key (node-right n))))
     (rotate-left (make-node (node-key n) (node-left n) (rotate-right (node-right n))))]
    [else n]))

(define (avl-inorder n)
  (if (not n)
      '()
      (append (avl-inorder (node-left n)) (list (node-key n)) (avl-inorder (node-right n)))))

(define tree
  (for/fold ([t #f]) ([key '(10 20 30 40 50 25)])
    (avl-insert t key)))

(displayln (avl-inorder tree))
(displayln (node-height tree))
