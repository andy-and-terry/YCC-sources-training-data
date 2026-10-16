#lang racket

(define in (open-input-string "42 foo (1 2 3) \"str\"\nsecond line\nthird"))
(displayln (read in))
(displayln (read in))
(displayln (read in))
(displayln (read in))
(displayln (read-char in))
(displayln (read-line in))
(displayln (peek-char in))
(displayln (read-string 3 in))
(displayln (read-line in))
(displayln (eof-object? (read-line in)))

(displayln (port->lines (open-input-string "a\nb\nc")))
(displayln (port->string (open-input-string "all of it")))
(displayln (with-input-from-string "7 8" (lambda () (+ (read) (read)))))
(displayln (read (open-input-string "#t")))
(displayln (call-with-input-string "x y" (lambda (p) (list (read p) (read p)))))
