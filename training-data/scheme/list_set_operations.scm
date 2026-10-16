;; Treating lists as sets: membership, union, intersection and difference.

(define (set-add x s)
  (if (member x s) s (cons x s)))

(define (set-union a b)
  (if (null? a)
      b
      (set-union (cdr a) (set-add (car a) b))))

(define (set-intersect a b)
  (cond ((null? a) '())
        ((member (car a) b) (cons (car a) (set-intersect (cdr a) b)))
        (else (set-intersect (cdr a) b))))

(define (set-diff a b)
  (cond ((null? a) '())
        ((member (car a) b) (set-diff (cdr a) b))
        (else (cons (car a) (set-diff (cdr a) b)))))

(define s1 '(1 2 3 4))
(define s2 '(3 4 5 6))

(display (set-union s1 s2)) (newline)
(display (set-intersect s1 s2)) (newline)
(display (set-diff s1 s2)) (newline)
