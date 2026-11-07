(define (plus-one digits)
  (let loop ((ds (reverse digits)) (carry 1) (out '()))
    (if (null? ds)
        (if (> carry 0) (cons carry out) out)
        (let ((s (+ (car ds) carry)))
          (loop (cdr ds) (quotient s 10) (cons (remainder s 10) out))))))

(display (plus-one '(1 2 9))) (newline) ; (1 3 0)
(display (plus-one '(9 9))) (newline)   ; (1 0 0)
