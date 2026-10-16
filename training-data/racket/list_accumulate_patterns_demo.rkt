#lang racket

;; Classic recursive patterns written out explicitly.
(define (my-sum lst)
  (if (null? lst) 0 (+ (car lst) (my-sum (cdr lst)))))

(define (my-map f lst)
  (if (null? lst) '() (cons (f (car lst)) (my-map f (cdr lst)))))

(define (my-filter p lst)
  (cond [(null? lst) '()]
        [(p (car lst)) (cons (car lst) (my-filter p (cdr lst)))]
        [else (my-filter p (cdr lst))]))

(define (my-reverse lst)
  (let loop ([l lst] [acc '()])
    (if (null? l) acc (loop (cdr l) (cons (car l) acc)))))

(define (my-append a b)
  (if (null? a) b (cons (car a) (my-append (cdr a) b))))

(displayln (my-sum '(1 2 3 4)))
(displayln (my-map add1 '(1 2 3)))
(displayln (my-filter even? '(1 2 3 4 5 6)))
(displayln (my-reverse '(a b c)))
(displayln (my-append '(1 2) '(3 4)))
