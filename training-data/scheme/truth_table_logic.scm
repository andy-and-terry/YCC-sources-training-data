;; Print the truth table of a boolean function over all inputs.

(define (bool->int b) (if b 1 0))

(define (truth-table f)
  (for-each
   (lambda (a)
     (for-each
      (lambda (b)
        (display (bool->int a)) (display " ")
        (display (bool->int b)) (display " | ")
        (display (bool->int (f a b)))
        (newline))
      '(#f #t)))
   '(#f #t)))

(define (xor a b) (and (or a b) (not (and a b))))
(define (implies a b) (or (not a) b))

(display "XOR") (newline)
(truth-table xor)
(display "IMPLIES") (newline)
(truth-table implies)
