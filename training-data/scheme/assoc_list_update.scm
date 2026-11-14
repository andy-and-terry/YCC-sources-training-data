(define (update al k f default)
  (cond ((null? al) (list (cons k (f default))))
        ((equal? (caar al) k) (cons (cons k (f (cdar al))) (cdr al)))
        (else (cons (car al) (update (cdr al) k f default)))))

(display (update (update '() 'a (lambda (n) (+ n 1)) 0) 'a (lambda (n) (+ n 1)) 0))
(newline)
