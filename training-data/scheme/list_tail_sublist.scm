;; list-tail, list-head style helpers and sliding windows.

(define (take lst n)
  (if (or (= n 0) (null? lst))
      '()
      (cons (car lst) (take (cdr lst) (- n 1)))))

(define (windows lst k)
  (if (< (length lst) k)
      '()
      (cons (take lst k) (windows (cdr lst) k))))

(define (chunk lst k)
  (if (null? lst)
      '()
      (cons (take lst k)
            (chunk (if (> (length lst) k) (list-tail lst k) '()) k))))

(define xs '(1 2 3 4 5 6 7))
(write (list-tail xs 4)) (newline)
(write (take xs 3)) (newline)
(write (windows xs 3)) (newline)
(write (chunk xs 3)) (newline)
(write (list-ref xs 2)) (newline)
(write (append xs '(8))) (newline)
