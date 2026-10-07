;; Variadic procedures with rest arguments, and apply.

(define (sum . nums)
  (if (null? nums) 0 (+ (car nums) (apply sum (cdr nums)))))

(define (average first . rest)
  (/ (apply + first rest) (+ 1 (length rest))))

(define (tag name . items)
  (cons name items))

(define (call-with-prefix f prefix . args)
  (apply f (append prefix args)))

(display (sum))
(newline)
(display (sum 1 2 3 4 5))
(newline)
(display (average 2 4 6 8))
(newline)
(display (tag 'ul "a" "b"))
(newline)
(display (apply + 1 2 '(3 4)))
(newline)
(display (apply max '(3 8 1)))
(newline)
(display (call-with-prefix list '(a b) 'c 'd))
(newline)
(display (apply map list '((1 2 3) (4 5 6))))
(newline)
(display ((lambda args (length args)) 'x 'y 'z))
(newline)
