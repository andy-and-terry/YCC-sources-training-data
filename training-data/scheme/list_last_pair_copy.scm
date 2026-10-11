;; Structure sharing versus copying with append and set-cdr!.

(define a (list 1 2 3))
(define b (list 4 5))
(define shared (append a b))

(display shared) (newline)

(define (last-pair* lst)
  (if (null? (cdr lst)) lst (last-pair* (cdr lst))))

(display (last-pair* shared)) (newline)

(define c (list 'x 'y))
(set-cdr! (last-pair* c) (list 'z))
(display c) (newline)

(define d (list-copy c))
(set-car! d 'changed)
(display c) (newline)
(display d) (newline)
(display (eq? (cddr c) (cddr d))) (newline)
(display (list-tail shared 2)) (newline)
(display (list-ref shared 3)) (newline)
