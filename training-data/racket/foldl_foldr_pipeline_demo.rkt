#lang racket

(define nums '(1 2 3 4 5 6 7 8 9 10))

(displayln (foldl + 0 nums))
(displayln (foldl cons '() '(1 2 3)))
(displayln (foldr cons '() '(1 2 3)))
(displayln (foldl (lambda (x acc) (cons (* x x) acc)) '() '(1 2 3)))
(displayln (foldr (lambda (x acc) (cons (* x x) acc)) '() '(1 2 3)))
(displayln (foldl (lambda (x acc) (string-append acc (number->string x))) "" '(1 2 3)))
(displayln (foldr (lambda (x acc) (string-append (number->string x) acc)) "" '(1 2 3)))

(define (my-map f lst) (foldr (lambda (x acc) (cons (f x) acc)) '() lst))
(define (my-filter p lst) (foldr (lambda (x acc) (if (p x) (cons x acc) acc)) '() lst))
(displayln (my-map add1 nums))
(displayln (my-filter even? nums))


(define (pipeline . fs)
  (lambda (x) (foldl (lambda (f acc) (f acc)) x fs)))

(define sum-odd-squares
  (pipeline (lambda (l) (filter odd? l))
            (lambda (l) (map sqr l))
            (lambda (l) (foldl + 0 l))))
(displayln (sum-odd-squares nums))
(displayln (foldl max 0 nums))
(displayln (foldl (lambda (x acc) (+ (* acc 10) x)) 0 '(1 2 3)))
(displayln (reverse (foldl (lambda (x acc) (if (member x acc) acc (cons x acc))) '() '(1 2 1 3 2))))
