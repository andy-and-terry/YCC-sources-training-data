;; Converting between strings, character lists and symbols.

(define s "Scheme")

(display (string->list s)) (newline)
(display (list->string (reverse (string->list s)))) (newline)
(display (map char-upcase (string->list s))) (newline)
(display (string-length s)) (newline)
(display (string-ref s 2)) (newline)
(write (string-ref s 2)) (newline)
(write (substring s 1 4)) (newline)
(write (string-append s "!" "?")) (newline)
(display (string->symbol "hello")) (newline)
(display (symbol->string 'world)) (newline)
(display (string<? "apple" "banana")) (newline)
(display (string=? "a" "a")) (newline)
