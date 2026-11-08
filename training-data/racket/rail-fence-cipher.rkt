#lang racket
(define (rail-fence s rails)
  (define cycle (append (range rails) (reverse (range 1 (sub1 rails)))))
  (define tagged
    (for/list ([c (in-string s)] [i (in-naturals)])
      (cons (list-ref cycle (modulo i (length cycle))) c)))
  (list->string (map cdr (sort tagged < #:key car))))
(displayln (rail-fence "WEAREDISCOVERED" 3))
