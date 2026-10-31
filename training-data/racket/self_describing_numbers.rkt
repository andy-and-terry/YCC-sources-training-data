#lang racket

(define (self-describing? n)
  (define ds (map (lambda (c) (- (char->integer c) 48)) (string->list (number->string n))))
  (for/and ([d ds] [i (in-naturals)])
    (= d (count (lambda (x) (= x i)) ds))))

(for ([n '(1210 2020 21200 1211)])
  (printf "~a ~a\n" n (self-describing? n)))
