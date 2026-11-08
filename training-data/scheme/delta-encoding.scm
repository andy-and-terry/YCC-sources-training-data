(define (delta-encode xs)
  (cons (car xs) (map - (cdr xs) xs)))

(define (delta-decode ds)
  (let loop ((ds ds) (acc 0) (out '()))
    (if (null? ds) (reverse out)
        (let ((v (+ acc (car ds))))
          (loop (cdr ds) v (cons v out))))))

(define d (delta-encode '(10 12 15 15 20)))
(display d) (newline)
(display (delta-decode d)) (newline)
