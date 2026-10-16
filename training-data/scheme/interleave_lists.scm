;; Interleave two lists and deal one list into two.

(define (interleave a b)
  (cond ((null? a) b)
        ((null? b) a)
        (else (cons (car a) (cons (car b) (interleave (cdr a) (cdr b)))))))

(define (deal lst)
  (if (or (null? lst) (null? (cdr lst)))
      (cons lst '())
      (let ((rest (deal (cddr lst))))
        (cons (cons (car lst) (car rest))
              (cons (cadr lst) (cdr rest))))))

(display (interleave '(1 2 3) '(a b c))) (newline)
(display (interleave '(1 2 3 4 5) '(a b))) (newline)
(display (deal '(1 2 3 4 5 6 7))) (newline)
(display (interleave (car (deal '(1 2 3 4 5))) (cdr (deal '(1 2 3 4 5))))) (newline)
