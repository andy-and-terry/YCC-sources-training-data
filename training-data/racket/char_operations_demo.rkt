#lang racket

(displayln (char-upcase #\a))
(displayln (char->integer #\A))
(displayln (integer->char 955))
(displayln (char-alphabetic? #\7))
(displayln (char-numeric? #\7))
(displayln (char-whitespace? #\space))
(displayln (char->integer #\7))

(define (rot13-char c)
  (cond
    [(char-lower-case? c)
     (integer->char (+ 97 (modulo (+ (- (char->integer c) 97) 13) 26)))]
    [(char-upper-case? c)
     (integer->char (+ 65 (modulo (+ (- (char->integer c) 65) 13) 26)))]
    [else c]))

(define (rot13 s) (list->string (map rot13-char (string->list s))))
(displayln (rot13 "Hello, World!"))
(displayln (rot13 (rot13 "Hello, World!")))
(displayln (string->list "abc"))
(displayln (list->string (filter char-alphabetic? (string->list "a1b2c3"))))
(displayln (char<? #\a #\b #\c))
