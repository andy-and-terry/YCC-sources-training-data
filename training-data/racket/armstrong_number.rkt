#lang racket

(define (digits n)
  (map (lambda (c) (- (char->integer c) (char->integer #\0))) (string->list (number->string n))))

(define (armstrong? n)
  (define ds (digits n))
  (define power (length ds))
  (= n (apply + (map (lambda (d) (expt d power)) ds))))

(displayln (armstrong? 153))
(displayln (armstrong? 154))
