;; Transpose a matrix represented as a list of lists
(define (transpose m)
  (if (null? (car m))
      '()
      (cons (map car m) (transpose (map cdr m)))))

(define m '((1 2 3) (4 5 6)))
(display (transpose m)) (newline)
(display (transpose (transpose m))) (newline)
