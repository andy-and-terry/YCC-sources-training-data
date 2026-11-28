(define (insert-tail x tails)
  (cond ((null? tails) (list x))
        ((>= (car tails) x) (cons x (cdr tails)))
        (else (cons (car tails) (insert-tail x (cdr tails))))))

(define (lis-length xs)
  (length (fold-left (lambda (tails x) (insert-tail x tails)) '() xs)))

(display (lis-length '(10 9 2 5 3 7 101 18))) (newline)
