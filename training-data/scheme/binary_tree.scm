(define (make-node value left right) (list value left right))
(define (node-value n) (car n))
(define (node-left n) (cadr n))
(define (node-right n) (caddr n))

(define (insert-node tree value)
  (cond
    ((null? tree) (make-node value '() '()))
    ((< value (node-value tree)) (make-node (node-value tree) (insert-node (node-left tree) value) (node-right tree)))
    ((> value (node-value tree)) (make-node (node-value tree) (node-left tree) (insert-node (node-right tree) value)))
    (else tree)))

(define (inorder tree)
  (if (null? tree)
      '()
      (append (inorder (node-left tree)) (list (node-value tree)) (inorder (node-right tree)))))

(define (build-tree values)
  (if (null? values)
      '()
      (insert-node (build-tree (cdr values)) (car values))))

(display (inorder (build-tree (reverse '(5 3 8 1 4 7 9)))))
(newline)
