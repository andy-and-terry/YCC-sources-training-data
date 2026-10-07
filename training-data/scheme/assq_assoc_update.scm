;; Functional update of association lists.

(define (alist-set alist key val)
  (cond ((null? alist) (list (cons key val)))
        ((equal? (caar alist) key) (cons (cons key val) (cdr alist)))
        (else (cons (car alist) (alist-set (cdr alist) key val)))))

(define (alist-remove alist key)
  (filter (lambda (p) (not (equal? (car p) key))) alist))

(define db '((a . 1) (b . 2)))
(define db2 (alist-set db 'b 20))
(define db3 (alist-set db2 'c 3))

(write db3) (newline)
(write (alist-remove db3 'a)) (newline)
(write (assq 'c db3)) (newline)
(write (cdr (assoc "x" '(("x" . 10))))) (newline)
(write (map car db3)) (newline)
