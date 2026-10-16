#lang racket

(struct money (amount currency)
  #:property prop:custom-write
  (lambda (m port mode)
    (fprintf port "~a ~a" (real->decimal-string (money-amount m) 2) (money-currency m))))

(define m (money 12.5 "EUR"))
(displayln m)
(print m)
(newline)
(write m)
(newline)
(displayln (format "total: ~a" m))
(displayln (list m (money 3 "USD")))

(struct celsius (deg)
  #:transparent
  #:property prop:procedure
  (lambda (self) (celsius-deg self)))
(displayln ((celsius 21)))

(struct ordered (n)
  #:property prop:equal+hash
  (list (lambda (a b rec) (= (ordered-n a) (ordered-n b)))
        (lambda (a rec) (ordered-n a))
        (lambda (a rec) 1)))
(displayln (equal? (ordered 1) (ordered 1)))
(displayln (hash-ref (hash (ordered 5) 'five) (ordered 5) 'no))
