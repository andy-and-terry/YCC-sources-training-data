;; Split a string on a delimiter character, then join it back.
(define (string-split-char str ch)
  (let loop ((chars (string->list str)) (current '()) (parts '()))
    (cond ((null? chars)
           (reverse (cons (list->string (reverse current)) parts)))
          ((char=? (car chars) ch)
           (loop (cdr chars) '() (cons (list->string (reverse current)) parts)))
          (else
           (loop (cdr chars) (cons (car chars) current) parts)))))

(define (string-join-with parts sep)
  (if (null? parts)
      ""
      (fold-left (lambda (acc s) (string-append acc sep s))
                 (car parts)
                 (cdr parts))))

(define fields (string-split-char "a,b,,c" #\,))
(write fields)
(newline)
(display (string-join-with fields "-"))
(newline)
