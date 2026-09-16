(define (node-value n) (car n))
(define (node-height n) (cadr n))
(define (node-left n) (caddr n))
(define (node-right n) (cadddr n))

(define (height n) (if (null? n) 0 (node-height n)))

(define (balance-factor n) (- (height (node-left n)) (height (node-right n))))

(define (make-balanced value left right)
  (list value (+ 1 (max (height left) (height right))) left right))

(define (rotate-right n)
  (let* ((l (node-left n))
         (new-right (make-balanced (node-value n) (node-right l) (node-right n))))
    (make-balanced (node-value l) (node-left l) new-right)))

(define (rotate-left n)
  (let* ((r (node-right n))
         (new-left (make-balanced (node-value n) (node-left n) (node-left r))))
    (make-balanced (node-value r) new-left (node-right r))))

(define (rebalance n)
  (let* ((v (node-value n))
         (l (node-left n))
         (r (node-right n))
         (balance (- (height l) (height r))))
    (cond
      ((and (> balance 1) (>= (balance-factor l) 0)) (rotate-right n))
      ((and (> balance 1) (< (balance-factor l) 0))
       (rotate-right (make-balanced v (rotate-left l) r)))
      ((and (< balance -1) (<= (balance-factor r) 0)) (rotate-left n))
      ((and (< balance -1) (> (balance-factor r) 0))
       (rotate-left (make-balanced v l (rotate-right r))))
      (else n))))

(define (avl-insert n value)
  (if (null? n)
      (make-balanced value '() '())
      (let ((v (node-value n)) (l (node-left n)) (r (node-right n)))
        (cond
          ((< value v) (rebalance (make-balanced v (avl-insert l value) r)))
          ((> value v) (rebalance (make-balanced v l (avl-insert r value))))
          (else n)))))

(define (avl-inorder n)
  (if (null? n)
      '()
      (append (avl-inorder (node-left n)) (list (node-value n)) (avl-inorder (node-right n)))))

(define (build-avl values)
  (fold-left avl-insert '() values))

(define tree (build-avl '(10 20 30 40 50 25)))
(display (avl-inorder tree))
(newline)
(display (height tree))
(newline)
