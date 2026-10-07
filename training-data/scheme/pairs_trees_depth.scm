;; Operations on nested lists treated as trees.

(define (tree-depth t)
  (if (pair? t)
      (+ 1 (apply max 0 (map tree-depth t)))
      0))

(define (count-leaves t)
  (cond ((null? t) 0)
        ((not (pair? t)) 1)
        (else (+ (count-leaves (car t)) (count-leaves (cdr t))))))

(define (tree-map f t)
  (cond ((null? t) '())
        ((pair? t) (cons (tree-map f (car t)) (tree-map f (cdr t))))
        (else (f t))))

(define (fringe t)
  (cond ((null? t) '())
        ((pair? t) (append (fringe (car t)) (fringe (cdr t))))
        (else (list t))))

(define tree '(1 (2 (3 4)) 5))
(write (tree-depth tree)) (newline)
(write (count-leaves tree)) (newline)
(write (tree-map (lambda (x) (* x 10)) tree)) (newline)
(write (fringe tree)) (newline)
