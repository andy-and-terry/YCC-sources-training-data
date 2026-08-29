(define (transpose matrix)
  (if (null? (car matrix))
      '()
      (cons (map car matrix) (transpose (map cdr matrix)))))

(define (dot-product v1 v2)
  (apply + (map * v1 v2)))

(define (multiply a b)
  (let ((bt (transpose b)))
    (map (lambda (row) (map (lambda (col) (dot-product row col)) bt)) a)))

(display (transpose '((1 2) (3 4))))
(newline)
(display (multiply '((1 2) (3 4)) '((5 6) (7 8))))
(newline)
