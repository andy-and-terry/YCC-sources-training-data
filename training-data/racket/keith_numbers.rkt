#lang racket
;; Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
(define (digits n)
  (map (lambda (c) (- (char->integer c) 48)) (string->list (number->string n))))

(define (keith? n)
  (define k (length (digits n)))
  ;; seq is kept newest-first
  (let loop ([seq (reverse (digits n))])
    (define last (car seq))
    (if (>= last n)
        (= last n)
        (loop (cons (apply + (take seq k)) seq)))))

(displayln (string-join (map number->string (filter keith? (range 10 1200))) " "))
