;; Remove consecutive duplicates.
(define (dedupe l)
  (cond ((or (null? l) (null? (cdr l))) l)
        ((eqv? (car l) (cadr l)) (dedupe (cdr l)))
        (else (cons (car l) (dedupe (cdr l))))))
(display (list->string (dedupe (string->list "aabbbcdd")))) (newline)
