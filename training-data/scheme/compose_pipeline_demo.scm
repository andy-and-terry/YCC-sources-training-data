;; Building pipelines from small functions.

(define (compose2 f g) (lambda (x) (f (g x))))

(define (pipe . fs)
  (lambda (x)
    (let loop ((fs fs) (v x))
      (if (null? fs) v (loop (cdr fs) ((car fs) v))))))

(define (map-fn f) (lambda (lst) (map f lst)))
(define (filter-fn pred)
  (lambda (lst)
    (let loop ((l lst) (acc '()))
      (cond ((null? l) (reverse acc))
            ((pred (car l)) (loop (cdr l) (cons (car l) acc)))
            (else (loop (cdr l) acc))))))
(define (reduce-fn f init)
  (lambda (lst)
    (let loop ((l lst) (acc init))
      (if (null? l) acc (loop (cdr l) (f acc (car l)))))))

(define sum-of-odd-squares
  (pipe (filter-fn odd?)
        (map-fn (lambda (x) (* x x)))
        (reduce-fn + 0)))

(display (sum-of-odd-squares '(1 2 3 4 5))) (newline)

(define inc (lambda (x) (+ x 1)))
(define dbl (lambda (x) (* x 2)))
(display ((compose2 inc dbl) 5)) (newline)
(display ((compose2 dbl inc) 5)) (newline)
(display ((pipe inc dbl inc) 1)) (newline)
(display ((pipe) 'unchanged)) (newline)
