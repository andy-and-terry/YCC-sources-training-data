(define (kadane lst)
  (define (helper items current best)
    (if (null? items)
        best
        (let* ((x (car items))
               (new-current (max x (+ current x)))
               (new-best (max best new-current)))
          (helper (cdr items) new-current new-best))))
  (helper (cdr lst) (car lst) (car lst)))

(display (kadane '(-2 1 -3 4 -1 2 1 -5 4)))
(newline)
