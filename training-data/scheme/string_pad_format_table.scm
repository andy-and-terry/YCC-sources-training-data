;; Formatting a text table with left and right padding.

(define (repeat-char c n)
  (if (<= n 0) "" (string-append (string c) (repeat-char c (- n 1)))))

(define (pad-right s width)
  (string-append s (repeat-char #\space (- width (string-length s)))))

(define (pad-left s width)
  (string-append (repeat-char #\space (- width (string-length s))) s))

(define rows '(("apple" 3 1.25) ("watermelon" 12 0.5) ("fig" 100 12.75)))

(define (print-row r)
  (display (pad-right (car r) 12))
  (display (pad-left (number->string (cadr r)) 5))
  (display (pad-left (number->string (caddr r)) 8))
  (newline))

(display (pad-right "item" 12))
(display (pad-left "qty" 5))
(display (pad-left "price" 8))
(newline)
(display (repeat-char #\- 25))
(newline)
(for-each print-row rows)
