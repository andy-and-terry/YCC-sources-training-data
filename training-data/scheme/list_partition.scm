;; Partition a list by predicate, returning two values
(define (partition pred lst)
  (let loop ((rest lst) (yes '()) (no '()))
    (cond ((null? rest) (values (reverse yes) (reverse no)))
          ((pred (car rest)) (loop (cdr rest) (cons (car rest) yes) no))
          (else (loop (cdr rest) yes (cons (car rest) no))))))

(call-with-values
    (lambda () (partition even? '(1 2 3 4 5 6 7)))
  (lambda (evens odds)
    (display evens) (newline)
    (display odds) (newline)))
