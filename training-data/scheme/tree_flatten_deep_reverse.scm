;; Recursion over nested lists (trees represented as lists).

(define (show x) (display x) (newline))

(define (flatten tree)
  (cond ((null? tree) '())
        ((pair? tree) (append (flatten (car tree)) (flatten (cdr tree))))
        (else (list tree))))

(define (deep-reverse tree)
  (if (pair? tree)
      (reverse (map deep-reverse tree))
      tree))

(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((pair? tree) (+ (count-leaves (car tree)) (count-leaves (cdr tree))))
        (else 1)))

(define (tree-depth tree)
  (if (pair? tree)
      (+ 1 (apply max 0 (map tree-depth tree)))
      0))

(define (tree-map f tree)
  (cond ((null? tree) '())
        ((pair? tree) (cons (tree-map f (car tree)) (tree-map f (cdr tree))))
        (else (f tree))))

(define t '(1 (2 (3 4)) 5 ((6))))
(show (flatten t))
(show (deep-reverse t))
(show (count-leaves t))
(show (tree-depth t))
(show (tree-map (lambda (x) (* x x)) t))
