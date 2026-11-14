(define (fold-l f acc lst) (if (null? lst) acc (fold-l f (f acc (car lst)) (cdr lst))))
(define (fold-r f acc lst) (if (null? lst) acc (f (car lst) (fold-r f acc (cdr lst)))))

(display (fold-l - 0 '(1 2 3))) (newline)
(display (fold-r - 0 '(1 2 3))) (newline)
