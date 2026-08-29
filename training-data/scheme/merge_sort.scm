(define (merge-lists left right)
  (cond
    ((null? left) right)
    ((null? right) left)
    ((<= (car left) (car right)) (cons (car left) (merge-lists (cdr left) right)))
    (else (cons (car right) (merge-lists left (cdr right))))))

(define (take-n lst n)
  (if (= n 0) '() (cons (car lst) (take-n (cdr lst) (- n 1)))))

(define (drop-n lst n)
  (if (= n 0) lst (drop-n (cdr lst) (- n 1))))

(define (merge-sort lst)
  (if (or (null? lst) (null? (cdr lst)))
      lst
      (let ((mid (quotient (length lst) 2)))
        (merge-lists (merge-sort (take-n lst mid)) (merge-sort (drop-n lst mid))))))

(display (merge-sort '(5 2 9 1 5 6)))
(newline)
