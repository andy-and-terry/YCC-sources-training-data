;; Convert a Roman numeral string to an integer.

(define (roman-value c)
  (case c
    ((#\I) 1) ((#\V) 5) ((#\X) 10) ((#\L) 50)
    ((#\C) 100) ((#\D) 500) ((#\M) 1000)
    (else (error "bad numeral" c))))

(define (roman->int s)
  (let loop ((cs (string->list s)) (total 0))
    (cond ((null? cs) total)
          ((and (pair? (cdr cs))
                (< (roman-value (car cs)) (roman-value (cadr cs))))
           (loop (cdr cs) (- total (roman-value (car cs)))))
          (else (loop (cdr cs) (+ total (roman-value (car cs))))))))

(for-each (lambda (s) (display s) (display " = ") (display (roman->int s)) (newline))
          '("III" "IV" "IX" "LVIII" "MCMXCIV"))
