;; Simple infinite streams built from thunks (no delay/force needed).

(define (stream-cons a thunk) (cons a thunk))
(define (stream-head s) (car s))
(define (stream-tail s) ((cdr s)))

(define (integers-from n)
  (stream-cons n (lambda () (integers-from (+ n 1)))))

(define (stream-map f s)
  (stream-cons (f (stream-head s))
               (lambda () (stream-map f (stream-tail s)))))

(define (stream-filter pred s)
  (if (pred (stream-head s))
      (stream-cons (stream-head s) (lambda () (stream-filter pred (stream-tail s))))
      (stream-filter pred (stream-tail s))))

(define (stream-take s n)
  (if (= n 0)
      '()
      (cons (stream-head s) (stream-take (stream-tail s) (- n 1)))))

(write (stream-take (integers-from 1) 5)) (newline)
(write (stream-take (stream-map (lambda (x) (* x x)) (integers-from 1)) 5)) (newline)
(write (stream-take (stream-filter even? (integers-from 1)) 5)) (newline)
