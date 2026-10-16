#lang racket

(define env '((x . 1) (y . 2)))
(displayln (assq 'y env))
(displayln (cdr (assq 'x env)))
(displayln (assq 'z env))
(displayln (assoc "b" '(("a" . 1) ("b" . 2))))
(displayln (assf even? '((1 . a) (2 . b) (4 . c))))

(define (alist-set alist k v)
  (cons (cons k v) (filter (lambda (p) (not (equal? (car p) k))) alist)))
(displayln (alist-set env 'x 100))
(displayln (map car env))
(displayln (remove 'x env (lambda (k p) (eq? k (car p)))))
(displayln (dict-ref env 'y))
(displayln (member 3 '(1 2 3 4)))
(displayln (memq 'q '(a b)))
(displayln (index-of '(a b c) 'c))
