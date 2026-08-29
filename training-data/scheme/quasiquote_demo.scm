(define x 5)
(define y 10)

(display `(a b ,x ,(+ y 1) ,@(list 1 2 3)))
(newline)
