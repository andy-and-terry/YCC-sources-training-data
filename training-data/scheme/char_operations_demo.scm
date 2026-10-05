;; Character predicates, conversions and string building.

(display (char-upcase #\a)) (newline)
(display (char->integer #\A)) (newline)
(display (integer->char 100)) (newline)
(display (list (char-alphabetic? #\x) (char-numeric? #\7) (char-whitespace? #\space)))
(newline)
(display (digit-value #\7)) (newline)
(display (integer->char (+ 5 (char->integer #\0)))) (newline)
(display (char<? #\a #\b #\c)) (newline)

(define (count-vowels str)
  (let loop ((cs (string->list str)) (n 0))
    (cond ((null? cs) n)
          ((memv (char-downcase (car cs)) '(#\a #\e #\i #\o #\u)) (loop (cdr cs) (+ n 1)))
          (else (loop (cdr cs) n)))))

(display (count-vowels "Programming Language")) (newline)
(display (list->string (map char-upcase (string->list "shout")))) (newline)
(display (string-map char-downcase "QUIET")) (newline)
