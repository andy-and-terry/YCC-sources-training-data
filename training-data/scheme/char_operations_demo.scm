;; Character predicates, conversions and simple string transforms.

(define (show x) (display x) (newline))

(show (char->integer #\A))
(show (integer->char 97))
(show (char-upcase #\q))
(show (char-alphabetic? #\7))
(show (char-numeric? #\7))
(show (char-whitespace? #\space))
(show (char<? #\a #\b #\c))

(define (digit-value c) (- (char->integer c) (char->integer #\0)))
(show (map digit-value (string->list "2024")))

(define (rot13-char c)
  (cond ((and (char>=? c #\a) (char<=? c #\z))
         (integer->char (+ 97 (modulo (+ (- (char->integer c) 97) 13) 26))))
        ((and (char>=? c #\A) (char<=? c #\Z))
         (integer->char (+ 65 (modulo (+ (- (char->integer c) 65) 13) 26))))
        (else c)))

(define (rot13 s) (list->string (map rot13-char (string->list s))))
(show (rot13 "Hello, World!"))
(show (rot13 (rot13 "Hello, World!")))

(define (count-vowels s)
  (let loop ((cs (string->list s)) (n 0))
    (cond ((null? cs) n)
          ((memv (char-downcase (car cs)) '(#\a #\e #\i #\o #\u)) (loop (cdr cs) (+ n 1)))
          (else (loop (cdr cs) n)))))
(show (count-vowels "Programming Language"))
