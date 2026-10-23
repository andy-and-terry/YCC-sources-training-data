;; Hand-rolled string split and join helpers (portable R7RS).

(define (string-split-char str ch)
  (let loop ((chars (string->list str)) (current '()) (parts '()))
    (cond ((null? chars)
           (reverse (cons (list->string (reverse current)) parts)))
          ((char=? (car chars) ch)
           (loop (cdr chars) '() (cons (list->string (reverse current)) parts)))
          (else (loop (cdr chars) (cons (car chars) current) parts)))))

(define (string-join strs sep)
  (if (null? strs)
      ""
      (fold-left-str (cdr strs) (car strs) sep)))

(define (fold-left-str rest acc sep)
  (if (null? rest)
      acc
      (fold-left-str (cdr rest) (string-append acc sep (car rest)) sep)))

(define parts (string-split-char "a,b,,c" #\,))
(write parts) (newline)
(write (string-join parts "|")) (newline)
(write (string-split-char "" #\,)) (newline)
(write (string-join '() "-")) (newline)

;; Round trip
(write (string-join (string-split-char "x y z" #\space) "_")) (newline)
