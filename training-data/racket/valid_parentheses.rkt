#lang racket

(define (valid-parens? s)
  (define pairs (hash #\) #\( #\] #\[ #\} #\{))
  (define (helper chars stack)
    (cond
      [(null? chars) (null? stack)]
      [(member (car chars) '(#\( #\[ #\{)) (helper (cdr chars) (cons (car chars) stack))]
      [(hash-has-key? pairs (car chars))
       (and (not (null? stack))
            (equal? (car stack) (hash-ref pairs (car chars)))
            (helper (cdr chars) (cdr stack)))]
      [else (helper (cdr chars) stack)]))
  (helper (string->list s) '()))

(displayln (valid-parens? "{[()]}"))
(displayln (valid-parens? "{[(])}"))
