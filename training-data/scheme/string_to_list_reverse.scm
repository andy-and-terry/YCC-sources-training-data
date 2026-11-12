(define (palindrome? s)
  (let ((l (string->list s))) (equal? l (reverse l))))
(display (list (palindrome? "level") (palindrome? "abc"))) (newline)
