;; fold-left and fold-right implemented by hand
(define (fold-left f acc lst)
  (if (null? lst)
      acc
      (fold-left f (f acc (car lst)) (cdr lst))))

(define (fold-right f acc lst)
  (if (null? lst)
      acc
      (f (car lst) (fold-right f acc (cdr lst)))))

(display (fold-left + 0 '(1 2 3 4 5))) (newline)
(display (fold-left (lambda (acc x) (cons x acc)) '() '(1 2 3))) (newline)
(display (fold-right cons '() '(1 2 3))) (newline)
(display (fold-right (lambda (x acc) (+ (* x x) acc)) 0 '(1 2 3))) (newline)
