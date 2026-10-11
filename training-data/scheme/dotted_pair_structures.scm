;; Pairs, dotted pairs and proper versus improper lists.

(define p (cons 1 2))
(define l (cons 1 (cons 2 (cons 3 '()))))
(define improper (cons 1 (cons 2 3)))

(display p) (newline)
(display l) (newline)
(display improper) (newline)
(display (list? l)) (newline)
(display (list? improper)) (newline)
(display (pair? '())) (newline)
(display (null? '())) (newline)
(display (cons '(a) '(b))) (newline)
(display (car (cdr (cdr l)))) (newline)
(display (cddr l)) (newline)
(display '(1 . (2 . (3 . ())))) (newline)
(display (length l)) (newline)
