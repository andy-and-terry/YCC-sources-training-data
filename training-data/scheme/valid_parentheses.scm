(define (matching-open close)
  (cond
    ((char=? close #\)) #\()
    ((char=? close #\]) #\[)
    ((char=? close #\}) #\{)
    (else #f)))

(define (valid-parens? str)
  (define (helper chars stack)
    (cond
      ((null? chars) (null? stack))
      ((memv (car chars) '(#\( #\[ #\{)) (helper (cdr chars) (cons (car chars) stack)))
      ((memv (car chars) '(#\) #\] #\}))
       (and (not (null? stack))
            (char=? (car stack) (matching-open (car chars)))
            (helper (cdr chars) (cdr stack))))
      (else (helper (cdr chars) stack))))
  (helper (string->list str) '()))

(display (valid-parens? "{[()]}"))
(newline)
(display (valid-parens? "{[(])}"))
(newline)
