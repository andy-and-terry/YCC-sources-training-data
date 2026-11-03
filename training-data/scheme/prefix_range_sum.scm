(define (make-prefix values)
  (let loop ((vs values) (acc 0) (out '(0)))
    (if (null? vs)
        (list->vector (reverse out))
        (let ((s (+ acc (car vs))))
          (loop (cdr vs) s (cons s out))))))

(define (query prefix lo hi)
  (- (vector-ref prefix hi) (vector-ref prefix lo)))

(display (query (make-prefix '(3 1 4 1 5 9 2 6)) 2 5))
(newline)
