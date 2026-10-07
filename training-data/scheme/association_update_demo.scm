;; Functional updates of association lists (no mutation).

(define (alist-set key value alist)
  (cond ((null? alist) (list (cons key value)))
        ((equal? (caar alist) key) (cons (cons key value) (cdr alist)))
        (else (cons (car alist) (alist-set key value (cdr alist))))))

(define (alist-remove key alist)
  (cond ((null? alist) '())
        ((equal? (caar alist) key) (cdr alist))
        (else (cons (car alist) (alist-remove key (cdr alist))))))

(define (alist-update key f default alist)
  (let ((entry (assoc key alist)))
    (alist-set key (f (if entry (cdr entry) default)) alist)))

(define inventory '(("apples" . 3) ("pears" . 5)))

(display (alist-set "apples" 10 inventory))
(newline)
(display (alist-set "kiwis" 1 inventory))
(newline)
(display (alist-remove "pears" inventory))
(newline)
(display (alist-update "apples" (lambda (n) (+ n 1)) 0 inventory))
(newline)
(display (alist-update "plums" (lambda (n) (+ n 1)) 0 inventory))
(newline)
(display inventory)
(newline)
(display (map car inventory))
(newline)
