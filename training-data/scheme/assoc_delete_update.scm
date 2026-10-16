;; Association lists with functional delete and update.

(define (alist-delete key alist)
  (cond ((null? alist) '())
        ((equal? (caar alist) key) (alist-delete key (cdr alist)))
        (else (cons (car alist) (alist-delete key (cdr alist))))))

(define (alist-set key value alist)
  (cons (cons key value) (alist-delete key alist)))

(define stock '((apples . 4) (pears . 7) (plums . 0)))

(display (assq 'pears stock)) (newline)
(display (cdr (assq 'apples stock))) (newline)
(display (alist-set 'apples 10 stock)) (newline)
(display (alist-delete 'plums stock)) (newline)
(display (map car stock)) (newline)
(display (assoc "b" '(("a" . 1) ("b" . 2)))) (newline)
