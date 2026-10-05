;; Flatten arbitrarily nested lists.

(define (flatten x)
  (cond ((null? x) '())
        ((pair? x) (append (flatten (car x)) (flatten (cdr x))))
        (else (list x))))

(display (flatten '(1 (2 (3 4)) () ((5)) 6)))
(newline)

;; Accumulator version avoiding append.
(define (flatten2 x)
  (let loop ((x x) (acc '()))
    (cond ((null? x) acc)
          ((pair? x) (loop (car x) (loop (cdr x) acc)))
          (else (cons x acc)))))

(display (flatten2 '((a b) (c (d (e))) f)))
(newline)
