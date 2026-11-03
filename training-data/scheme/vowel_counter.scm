(define (count-char ch str)
  (length (filter (lambda (c) (char=? c ch)) (string->list str))))

(define text (string-downcase "Education is beautiful"))

(for-each
 (lambda (v)
   (display v) (display "=") (display (count-char v text)) (display " "))
 (string->list "aeiou"))
(newline)
