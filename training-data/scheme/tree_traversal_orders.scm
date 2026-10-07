;; Preorder, inorder, postorder traversals; a tree is (value left right) or ()
(define (node v l r) (list v l r))
(define (value t) (car t))
(define (left t) (cadr t))
(define (right t) (caddr t))

(define (preorder t)
  (if (null? t) '()
      (append (list (value t)) (preorder (left t)) (preorder (right t)))))
(define (inorder t)
  (if (null? t) '()
      (append (inorder (left t)) (list (value t)) (inorder (right t)))))
(define (postorder t)
  (if (null? t) '()
      (append (postorder (left t)) (postorder (right t)) (list (value t)))))

(define tree
  (node 4 (node 2 (node 1 '() '()) (node 3 '() '()))
          (node 6 (node 5 '() '()) (node 7 '() '()))))

(display (preorder tree)) (newline)
(display (inorder tree)) (newline)
(display (postorder tree)) (newline)
