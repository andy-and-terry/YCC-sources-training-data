#lang racket
;; Integer (1..3999) to Roman numeral using a greedy table.
(define table
  '((1000 . "M") (900 . "CM") (500 . "D") (400 . "CD") (100 . "C") (90 . "XC")
    (50 . "L") (40 . "XL") (10 . "X") (9 . "IX") (5 . "V") (4 . "IV") (1 . "I")))

(define (to-roman n)
  (let loop ([n n] [tbl table] [out '()])
    (cond [(zero? n) (apply string-append (reverse out))]
          [(>= n (caar tbl)) (loop (- n (caar tbl)) tbl (cons (cdar tbl) out))]
          [else (loop n (cdr tbl) out)])))

(printf "~a ~a\n" (to-roman 1994) (to-roman 58))
