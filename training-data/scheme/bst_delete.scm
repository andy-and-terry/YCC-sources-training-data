;; Binary search tree as nested lists (key left right) with insert and delete.

(define (make-node k l r) (list k l r))
(define (key t) (car t))
(define (left t) (cadr t))
(define (right t) (caddr t))

(define (insert t k)
  (cond ((null? t) (make-node k '() '()))
        ((< k (key t)) (make-node (key t) (insert (left t) k) (right t)))
        ((> k (key t)) (make-node (key t) (left t) (insert (right t) k)))
        (else t)))

(define (min-key t)
  (if (null? (left t)) (key t) (min-key (left t))))

(define (delete t k)
  (cond ((null? t) '())
        ((< k (key t)) (make-node (key t) (delete (left t) k) (right t)))
        ((> k (key t)) (make-node (key t) (left t) (delete (right t) k)))
        ((null? (left t)) (right t))
        ((null? (right t)) (left t))
        (else (let ((m (min-key (right t))))
                (make-node m (left t) (delete (right t) m))))))

(define (inorder t)
  (if (null? t)
      '()
      (append (inorder (left t)) (list (key t)) (inorder (right t)))))

(define (insert-all t ks) (if (null? ks) t (insert-all (insert t (car ks)) (cdr ks))))
(define tree (insert-all '() '(50 30 70 20 40 60 80)))
(display (inorder tree)) (newline)
(display (inorder (delete tree 30))) (newline)
(display (inorder (delete tree 50))) (newline)
