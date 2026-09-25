;; Generate all permutations of a list by picking each element in turn
;; as the head and recursively permuting the rest.

(define (remove-once x lst)
  (cond
    ((null? lst) '())
    ((equal? (car lst) x) (cdr lst))
    (else (cons (car lst) (remove-once x (cdr lst))))))

(define (permutations lst)
  (if (null? lst)
      '(())
      (apply append
             (map (lambda (x)
                    (map (lambda (p) (cons x p))
                         (permutations (remove-once x lst))))
                  lst))))

(display (permutations '(1 2 3)))
(newline)
(display (length (permutations '(1 2 3 4))))
(newline)
