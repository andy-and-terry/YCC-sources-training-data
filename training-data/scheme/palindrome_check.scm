(define (char-alphanumeric? c)
  (or (char-alphabetic? c) (char-numeric? c)))

(define (palindrome? s)
  (let* ((lower (string-downcase s))
         (chars (filter char-alphanumeric? (string->list lower))))
    (equal? chars (reverse chars))))

(display (palindrome? "A man, a plan, a canal: Panama"))
(newline)
(display (palindrome? "hello"))
(newline)
