#lang racket

(struct node (value left right) #:transparent)

(define (insert-node tree value)
  (cond
    [(not tree) (node value #f #f)]
    [(< value (node-value tree)) (node (node-value tree) (insert-node (node-left tree) value) (node-right tree))]
    [(> value (node-value tree)) (node (node-value tree) (node-left tree) (insert-node (node-right tree) value))]
    [else tree]))

(define (inorder tree)
  (if (not tree)
      '()
      (append (inorder (node-left tree)) (list (node-value tree)) (inorder (node-right tree)))))

(define tree (foldl (lambda (v t) (insert-node t v)) #f '(5 3 8 1 4 7 9)))
(displayln (inorder tree))
