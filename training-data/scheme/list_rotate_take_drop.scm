;; Hand-rolled take, drop and rotate on lists.

(define (take lst n)
  (if (or (= n 0) (null? lst))
      '()
      (cons (car lst) (take (cdr lst) (- n 1)))))

(define (drop lst n)
  (if (or (= n 0) (null? lst))
      lst
      (drop (cdr lst) (- n 1))))

(define (rotate-left lst n)
  (let ((k (modulo n (length lst))))
    (append (drop lst k) (take lst k))))

(define (split-at lst n)
  (cons (take lst n) (drop lst n)))

(define xs '(a b c d e f))
(display (take xs 2)) (newline)
(display (drop xs 4)) (newline)
(display (rotate-left xs 2)) (newline)
(display (rotate-left xs 8)) (newline)
(display (split-at xs 3)) (newline)
