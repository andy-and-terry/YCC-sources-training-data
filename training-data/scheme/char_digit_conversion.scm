;; Mapping between characters, digits and integer codes.

(define (char->digit c)
  (- (char->integer c) (char->integer #\0)))

(define (digit->char d)
  (integer->char (+ d (char->integer #\0))))

(define (string->number* s)
  (let loop ((cs (string->list s)) (acc 0))
    (if (null? cs)
        acc
        (loop (cdr cs) (+ (* acc 10) (char->digit (car cs)))))))

(define (number->digits n)
  (map char->digit (string->list (number->string n))))

(display (char->digit #\7)) (newline)
(display (digit->char 4)) (newline)
(display (string->number* "90210")) (newline)
(display (number->digits 31415)) (newline)
(display (char->integer #\A)) (newline)
(display (integer->char 98)) (newline)
(display (number->string 255 16)) (newline)
(display (string->number "ff" 16)) (newline)
