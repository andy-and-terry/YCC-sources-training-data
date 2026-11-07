#lang racket

(define (column-title n)
  (if (zero? n)
      ""
      (string-append (column-title (quotient (sub1 n) 26))
                     (string (integer->char (+ 65 (remainder (sub1 n) 26)))))))

(displayln (string-append (column-title 28) " " (column-title 701))) ; AB ZY
