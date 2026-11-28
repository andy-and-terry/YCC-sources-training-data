#lang racket
(define (lyndon? w)
  (for/and ([i (in-range 1 (string-length w))])
    (string<? w (substring w i))))

(define (factor s)
  (if (string=? s "")
      '()
      (let ([len (for/first ([n (in-range (string-length s) 0 -1)]
                             #:when (lyndon? (substring s 0 n)))
                   n)])
        (cons (substring s 0 len) (factor (substring s len))))))

(displayln (factor "banana"))
