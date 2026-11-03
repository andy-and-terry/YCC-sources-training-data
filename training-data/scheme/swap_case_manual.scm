(define (swap-case s)
  (list->string
   (map (lambda (c) (if (char-upper-case? c) (char-downcase c) (char-upcase c)))
        (string->list s))))

(display (swap-case "Hello World 42"))
(newline)
