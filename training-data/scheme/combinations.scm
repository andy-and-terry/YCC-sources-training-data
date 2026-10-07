;; Generate all k-element combinations of a list.

(define (combinations lst k)
  (cond
    ((= k 0) '(()))
    ((null? lst) '())
    (else
     (append
      (map (lambda (c) (cons (car lst) c))
           (combinations (cdr lst) (- k 1)))
      (combinations (cdr lst) k)))))

(display (combinations '(1 2 3 4) 2))
(newline)
(display (length (combinations '(1 2 3 4 5) 3)))
(newline)
