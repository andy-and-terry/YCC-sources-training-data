;; Symbols as data
(define (symbol-length s) (string-length (symbol->string s)))

(display (symbol? 'abc)) (newline)
(display (eq? 'abc 'abc)) (newline)
(display (string->symbol "hello")) (newline)
(display (symbol-length 'scheme)) (newline)
(display (map symbol->string '(a b c))) (newline)
(display (memq 'c '(a b c d))) (newline)
(display (assq 'y '((x . 1) (y . 2)))) (newline)
