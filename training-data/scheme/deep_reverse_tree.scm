;; Reverse a list and all of its sublists, and map over tree leaves.

(define (deep-reverse x)
  (cond ((null? x) '())
        ((pair? x) (append (deep-reverse (cdr x))
                           (list (deep-reverse (car x)))))
        (else x)))

(define (tree-map f tree)
  (cond ((null? tree) '())
        ((pair? tree) (cons (tree-map f (car tree)) (tree-map f (cdr tree))))
        (else (f tree))))

(define (tree-fold f init tree)
  (cond ((null? tree) init)
        ((pair? tree) (tree-fold f (tree-fold f init (car tree)) (cdr tree)))
        (else (f init tree))))

(define t '(1 (2 3) ((4 5) 6)))

(display (deep-reverse t))
(newline)
(display (reverse t))
(newline)
(display (tree-map (lambda (x) (* x x)) t))
(newline)
(display (tree-fold + 0 t))
(newline)
(display (tree-fold (lambda (acc x) (cons x acc)) '() t))
(newline)
