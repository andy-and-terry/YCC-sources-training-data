(define (interleave2 a b)
  (cond ((null? a) b)
        ((null? b) a)
        (else (cons (car a) (cons (car b) (interleave2 (cdr a) (cdr b)))))))

(display (list->string (interleave2 (string->list "abc") (string->list "12345"))))
(newline)
