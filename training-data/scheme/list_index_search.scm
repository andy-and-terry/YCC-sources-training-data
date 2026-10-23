;; Finding the position of the first element satisfying a predicate.

(define (list-index pred lst)
  (let loop ((rest lst) (i 0))
    (cond ((null? rest) #f)
          ((pred (car rest)) i)
          (else (loop (cdr rest) (+ i 1))))))

(define (find-tail pred lst)
  (cond ((null? lst) #f)
        ((pred (car lst)) lst)
        (else (find-tail pred (cdr lst)))))

(define (index-of x lst)
  (list-index (lambda (y) (equal? x y)) lst))

(define nums '(3 8 15 22 7))

(display (list-index even? nums)) (newline)
(display (list-index (lambda (n) (> n 100)) nums)) (newline)
(display (index-of 'c '(a b c d))) (newline)
(display (find-tail (lambda (n) (> n 10)) nums)) (newline)
(display (index-of "two" '("one" "two" "three"))) (newline)
