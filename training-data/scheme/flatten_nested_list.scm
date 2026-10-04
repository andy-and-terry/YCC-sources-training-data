;; Flatten an arbitrarily nested list, plus related tree utilities.

(define (flatten tree)
  (cond ((null? tree) '())
        ((pair? tree) (append (flatten (car tree)) (flatten (cdr tree))))
        (else (list tree))))

(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((pair? tree) (+ (count-leaves (car tree)) (count-leaves (cdr tree))))
        (else 1)))

(define (tree-depth tree)
  (if (pair? tree)
      (+ 1 (apply max 0 (map tree-depth tree)))
      0))

(define nested '(1 (2 (3 4)) ((5)) 6))

(display (flatten nested))
(newline)
(display (count-leaves nested))
(newline)
(display (tree-depth nested))
(newline)
(display (flatten '()))
(newline)
(display (flatten '((a b) (c (d (e))))))
(newline)
