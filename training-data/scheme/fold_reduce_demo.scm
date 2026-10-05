;; Hand-written fold-left / fold-right and what they can build.

(define (fold-left f init lst)
  (if (null? lst)
      init
      (fold-left f (f init (car lst)) (cdr lst))))

(define (fold-right f init lst)
  (if (null? lst)
      init
      (f (car lst) (fold-right f init (cdr lst)))))

(display (fold-left + 0 '(1 2 3 4))) (newline)
(display (fold-left (lambda (acc x) (cons x acc)) '() '(1 2 3))) (newline)
(display (fold-right cons '() '(1 2 3))) (newline)
(display (fold-left - 10 '(1 2 3))) (newline)
(display (fold-right - 10 '(1 2 3))) (newline)

(define (my-map f lst) (fold-right (lambda (x acc) (cons (f x) acc)) '() lst))
(define (my-filter p lst)
  (fold-right (lambda (x acc) (if (p x) (cons x acc) acc)) '() lst))
(define (my-length lst) (fold-left (lambda (n _) (+ n 1)) 0 lst))

(display (my-map (lambda (x) (* x x)) '(1 2 3 4))) (newline)
(display (my-filter odd? '(1 2 3 4 5))) (newline)
(display (my-length '(a b c))) (newline)
