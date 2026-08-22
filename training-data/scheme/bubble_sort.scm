(define (bubble-pass lst)
  (cond
    ((or (null? lst) (null? (cdr lst))) lst)
    ((> (car lst) (cadr lst))
     (cons (cadr lst) (bubble-pass (cons (car lst) (cddr lst)))))
    (else (cons (car lst) (bubble-pass (cdr lst))))))

(define (bubble-sort lst)
  (let ((n (length lst)))
    (let loop ((l lst) (i 0))
      (if (= i n) l (loop (bubble-pass l) (+ i 1))))))

(display (bubble-sort '(5 2 9 1 5 6)))
(newline)
