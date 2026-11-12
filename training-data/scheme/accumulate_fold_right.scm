(define (fold-right2 f init lst) (if (null? lst) init (f (car lst) (fold-right2 f init (cdr lst)))))
(display (fold-right2 + 0 '(1 2 3 4))) (newline)
(display (fold-right2 cons '() '(1 2 3))) (newline)
