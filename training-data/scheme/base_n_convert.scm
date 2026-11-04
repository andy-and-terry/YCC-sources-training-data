(define digits "0123456789abcdefghijklmnopqrstuvwxyz")

(define (to-base n base)
  (if (< n base)
      (string (string-ref digits n))
      (string-append (to-base (quotient n base) base)
                     (string (string-ref digits (remainder n base))))))

(for-each (lambda (b)
            (display "255 in base ") (display b) (display " = ")
            (display (to-base 255 b)) (newline))
          '(2 8 16 36))
