(define (insert-sorted x lst)
  (cond ((null? lst) (list x))
        ((> x (car lst)) (cons x lst))
        (else (cons (car lst) (insert-sorted x (cdr lst))))))

(define (sort-descending lst)
  (if (null? lst)
      '()
      (insert-sorted (car lst) (sort-descending (cdr lst)))))

(define (kth-largest nums k)
  (list-ref (sort-descending nums) (- k 1)))

(display (kth-largest '(3 2 1 5 6 4) 2))
(newline)
(display (kth-largest '(3 2 3 1 2 4 5 5 6) 4))
(newline)
