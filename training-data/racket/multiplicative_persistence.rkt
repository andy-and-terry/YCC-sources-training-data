#lang racket

(define (digit-product n)
  (apply * (map (lambda (c) (- (char->integer c) 48)) (string->list (number->string n)))))

(define (persistence n)
  (if (< n 10) 0 (+ 1 (persistence (digit-product n)))))

(for ([n '(39 77 999 10)])
  (printf "~a ~a\n" n (persistence n)))
