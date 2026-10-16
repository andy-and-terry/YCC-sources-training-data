;; Mapping and folding over arbitrarily nested lists (trees).

(define (tree-map f tree)
  (cond ((null? tree) '())
        ((pair? tree) (cons (tree-map f (car tree))
                            (tree-map f (cdr tree))))
        (else (f tree))))

(define (tree-fold f init tree)
  (cond ((null? tree) init)
        ((pair? tree) (tree-fold f (tree-fold f init (car tree)) (cdr tree)))
        (else (f init tree))))

(define t '(1 (2 3) ((4) 5) 6))

(display (tree-map (lambda (x) (* x 10)) t)) (newline)
(display (tree-fold + 0 t)) (newline)
(display (tree-fold (lambda (acc x) (+ acc 1)) 0 t)) (newline)
(display (tree-fold max 0 t)) (newline)
