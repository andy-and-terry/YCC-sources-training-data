;; Operations on trees represented as nested lists.

(define (deep-reverse x)
  (if (pair? x)
      (reverse (map deep-reverse x))
      x))

(display (deep-reverse '(1 (2 3) (4 (5 6))))) (newline)

(define (count-leaves t)
  (cond ((null? t) 0)
        ((not (pair? t)) 1)
        (else (+ (count-leaves (car t)) (count-leaves (cdr t))))))

(display (count-leaves '((1 2) (3 (4 5)) 6))) (newline)

(define (tree-map f t)
  (cond ((null? t) '())
        ((pair? t) (cons (tree-map f (car t)) (tree-map f (cdr t))))
        (else (f t))))

(display (tree-map (lambda (x) (* x x)) '(1 (2 3) (4 (5))))) (newline)

(define (tree-depth t)
  (if (pair? t)
      (+ 1 (apply max 0 (map tree-depth t)))
      0))

(display (tree-depth '(1 (2 (3 (4)))))) (newline)
