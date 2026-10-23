;; Converting between numbers and strings, with radix.

(display (number->string 255)) (newline)         ; "255"
(display (number->string 255 16)) (newline)      ; "ff"
(display (number->string 5 2)) (newline)         ; "101"
(display (number->string 3.5)) (newline)

(display (string->number "42")) (newline)
(display (string->number "ff" 16)) (newline)     ; 255
(display (string->number "1/3")) (newline)       ; exact rational
(display (string->number "1e3")) (newline)
(display (string->number "not-a-number")) (newline)  ; #f

;; string->number returns #f on failure, so test before use.
(define (safe-parse s default)
  (let ((n (string->number s)))
    (if n n default)))
(display (list (safe-parse "12" 0) (safe-parse "zz" 0))) (newline)

;; Digits of a number via conversion
(define (digits n)
  (map (lambda (c) (- (char->integer c) (char->integer #\0)))
       (string->list (number->string n))))
(display (digits 90817)) (newline)

(define (pad-left s width ch)
  (if (>= (string-length s) width)
      s
      (string-append (make-string (- width (string-length s)) ch) s)))
(display (pad-left (number->string 7) 3 #\0)) (newline)
