;; filter, remove and partition implemented from scratch.

(define (filter pred lst)
  (cond ((null? lst) '())
        ((pred (car lst)) (cons (car lst) (filter pred (cdr lst))))
        (else (filter pred (cdr lst)))))

(define (remove pred lst)
  (filter (lambda (x) (not (pred x))) lst))

(define (partition pred lst)
  (let loop ((l lst) (yes '()) (no '()))
    (cond ((null? l) (cons (reverse yes) (reverse no)))
          ((pred (car l)) (loop (cdr l) (cons (car l) yes) no))
          (else (loop (cdr l) yes (cons (car l) no))))))

(define (delete-duplicates lst)
  (let loop ((l lst) (seen '()))
    (cond ((null? l) (reverse seen))
          ((member (car l) seen) (loop (cdr l) seen))
          (else (loop (cdr l) (cons (car l) seen))))))

(define nums '(1 2 3 4 5 6 7 8 9 10))

(display (filter even? nums))
(newline)
(display (remove even? nums))
(newline)
(display (partition (lambda (n) (> n 6)) nums))
(newline)
(display (delete-duplicates '(a b a c b d)))
(newline)
(display (filter (lambda (s) (> (string-length s) 3)) '("hi" "hello" "yo" "scheme")))
(newline)
