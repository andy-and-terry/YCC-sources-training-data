;; Counts via an association list of pair sums (small inputs only).
(define (bump alist key)
  (cond ((null? alist) (list (cons key 1)))
        ((= (caar alist) key) (cons (cons key (+ 1 (cdar alist))) (cdr alist)))
        (else (cons (car alist) (bump (cdr alist) key)))))

(define (four-sum-count a b c d)
  (let ((sums (fold-left (lambda (acc x)
                           (fold-left (lambda (acc y) (bump acc (+ x y))) acc b))
                         '() a)))
    (fold-left (lambda (total x)
                 (fold-left (lambda (total y)
                              (let ((hit (assv (- (+ x y)) sums)))
                                (if hit (+ total (cdr hit)) total)))
                            total d))
               0 c)))

(display (four-sum-count '(1 2) '(-2 -1) '(-1 2) '(0 2))) (newline) ; 2
