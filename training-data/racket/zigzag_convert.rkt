#lang racket

(define (zigzag s rows)
  (if (or (= rows 1) (>= rows (string-length s)))
      s
      (let* ([cycle (append (range rows) (range (- rows 2) 0 -1))]
             [row-of (for/list ([i (in-range (string-length s))])
                       (list-ref cycle (modulo i (length cycle))))])
        (list->string
         (for*/list ([r (in-range rows)]
                     [(c i) (in-indexed (string->list s))]
                     #:when (= r (list-ref row-of i)))
           c)))))

(displayln (zigzag "PAYPALISHIRING" 3))
