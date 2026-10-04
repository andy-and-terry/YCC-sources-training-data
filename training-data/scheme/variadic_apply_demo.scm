;; Variadic procedures, rest arguments and apply.

(define (sum . nums)
  (if (null? nums) 0 (+ (car nums) (apply sum (cdr nums)))))

(display (sum)) (newline)
(display (sum 1 2 3 4)) (newline)

(define (tagged tag first . rest)
  (cons tag (cons first rest)))
(display (tagged 'point 1 2 3)) (newline)

(define (average first . rest)
  (/ (apply + first rest) (+ 1 (length rest))))
(display (average 2 4 9)) (newline)

(define args (list 3 9 4))
(display (apply max args)) (newline)
(display (apply max 10 args)) (newline)
(display (apply map list '((1 2 3) (4 5 6)))) (newline)

(define (compose . fs)
  (if (null? fs)
      (lambda (x) x)
      (lambda (x) ((car fs) ((apply compose (cdr fs)) x)))))
(display ((compose (lambda (x) (* x 2)) (lambda (x) (+ x 1))) 5)) (newline)

(define (print-all . items)
  (for-each (lambda (i) (display i) (display " ")) items)
  (newline))
(print-all "a" 1 'b #\c)
