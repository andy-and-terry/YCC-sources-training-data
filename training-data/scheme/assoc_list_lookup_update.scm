(define db '((a . 1) (b . 2)))
(display (cdr (assq 'b db))) (newline)
(define (put k v l) (cons (cons k v) (filter (lambda (p) (not (eq? (car p) k))) l)))
(display (put 'a 10 db)) (newline)
