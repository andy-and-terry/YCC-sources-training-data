;; Finding every index at which an element occurs, plus a position lookup.

(define (indices-of x lst)
  (let loop ((l lst) (i 0) (acc '()))
    (cond ((null? l) (reverse acc))
          ((equal? (car l) x) (loop (cdr l) (+ i 1) (cons i acc)))
          (else (loop (cdr l) (+ i 1) acc)))))

(define (index-of x lst)
  (let ((r (indices-of x lst)))
    (if (null? r) #f (car r))))

(define (replace-all x y lst)
  (map (lambda (e) (if (equal? e x) y e)) lst))

(define data '(a b a c a d))
(display (indices-of 'a data)) (newline)
(display (index-of 'c data)) (newline)
(display (index-of 'q data)) (newline)
(display (replace-all 'a 'Z data)) (newline)
(display (indices-of 1 '(1 2 1 1))) (newline)
