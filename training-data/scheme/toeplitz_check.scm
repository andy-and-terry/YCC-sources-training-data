(define (take lst n)
  (if (or (= n 0) (null? lst)) '() (cons (car lst) (take (cdr lst) (- n 1)))))

(define (toeplitz? m)
  (or (null? m) (null? (cdr m))
      (and (equal? (cdr (cadr m)) (take (car m) (- (length (cadr m)) 1)))
           (toeplitz? (cdr m)))))

(display (toeplitz? '((1 2 3) (4 1 2) (5 4 1)))) (newline)
(display (toeplitz? '((1 2) (2 2)))) (newline)
