(define db '((a . 1) (b . 2)))
(define (put k v alist) (cons (cons k v) (filter (lambda (p) (not (eq? (car p) k))) alist)))
(display (put 'a 10 db))
(newline)
