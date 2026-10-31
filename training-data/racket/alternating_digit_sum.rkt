#lang racket

(define (alternating-digit-sum n)
  (define ds (reverse (map (lambda (c) (- (char->integer c) 48)) (string->list (number->string n)))))
  (for/sum ([d ds] [i (in-naturals)]) (if (even? i) d (- d))))

(for ([n '(1234 99999 1000)])
  (printf "~a ~a\n" n (alternating-digit-sum n)))
