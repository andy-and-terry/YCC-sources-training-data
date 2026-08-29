(define (find-min lst)
  (if (null? (cdr lst))
      (car lst)
      (min (car lst) (find-min (cdr lst)))))

(define (remove-first x lst)
  (cond
    ((null? lst) '())
    ((= (car lst) x) (cdr lst))
    (else (cons (car lst) (remove-first x (cdr lst))))))

(define (selection-sort lst)
  (if (null? lst)
      '()
      (let ((m (find-min lst)))
        (cons m (selection-sort (remove-first m lst))))))

(display (selection-sort '(5 3 8 1 9 2)))
(newline)
