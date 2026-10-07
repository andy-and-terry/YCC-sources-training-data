;; Flatten an arbitrarily nested list
(define (flatten x)
  (cond ((null? x) '())
        ((pair? x) (append (flatten (car x)) (flatten (cdr x))))
        (else (list x))))

(display (flatten '(1 (2 (3 4)) ((5) 6) ()))) (newline)
(display (flatten '(a (b (c (d)))))) (newline)
