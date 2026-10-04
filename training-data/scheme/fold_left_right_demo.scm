;; fold-left and fold-right defined by hand, showing how the
;; direction of the fold changes the result for non-commutative ops.

(define (fold-left f init lst)
  (if (null? lst)
      init
      (fold-left f (f init (car lst)) (cdr lst))))

(define (fold-right f init lst)
  (if (null? lst)
      init
      (f (car lst) (fold-right f init (cdr lst)))))

(display (fold-left + 0 '(1 2 3 4)))
(newline)
(display (fold-left - 0 '(1 2 3)))     ; ((0-1)-2)-3 = -6
(newline)
(display (fold-right - 0 '(1 2 3)))    ; 1-(2-(3-0)) = 2
(newline)
(display (fold-left cons '() '(1 2 3))) ; reverses
(newline)
(display (fold-right cons '() '(1 2 3))) ; copies
(newline)
(display (fold-left (lambda (acc x) (string-append acc (number->string x))) "" '(1 2 3)))
(newline)
(display (fold-right (lambda (x acc) (if (even? x) (cons x acc) acc)) '() '(1 2 3 4 5 6)))
(newline)
(display (fold-left max 0 '(3 9 2 7)))
(newline)
