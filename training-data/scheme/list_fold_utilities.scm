;; Hand-rolled list utilities: fold, filter, partition, zip, take/drop.

(define (fold-left f init lst)
  (if (null? lst) init (fold-left f (f init (car lst)) (cdr lst))))

(define (fold-right f init lst)
  (if (null? lst) init (f (car lst) (fold-right f init (cdr lst)))))

(define (take lst n)
  (if (or (= n 0) (null? lst)) '() (cons (car lst) (take (cdr lst) (- n 1)))))

(define (drop lst n)
  (if (or (= n 0) (null? lst)) lst (drop (cdr lst) (- n 1))))

(define (zip a b)
  (if (or (null? a) (null? b)) '() (cons (list (car a) (car b)) (zip (cdr a) (cdr b)))))

(define (partition pred lst)
  (fold-right (lambda (x acc)
                (if (pred x)
                    (cons (cons x (car acc)) (cdr acc))
                    (cons (car acc) (cons x (cdr acc)))))
              (cons '() '())
              lst))

(define (range a b) (if (>= a b) '() (cons a (range (+ a 1) b))))

(define nums (range 1 11))
(display (fold-left + 0 nums)) (newline)
(display (fold-right cons '() '(a b c))) (newline)
(display (fold-left (lambda (acc x) (cons x acc)) '() nums)) (newline)
(display (take nums 3)) (newline)
(display (drop nums 7)) (newline)
(display (zip '(a b c) '(1 2 3))) (newline)
(display (partition even? nums)) (newline)
