(define (make-circular-buffer capacity)
  (list (make-vector capacity 0) capacity 0 0))

(define (cb-push! buf value)
  (let* ((data (car buf)) (capacity (cadr buf)) (size (caddr buf)) (start (cadddr buf))
         (index (remainder (+ start size) capacity)))
    (vector-set! data index value)
    (if (< size capacity)
        (list data capacity (+ size 1) start)
        (list data capacity size (remainder (+ start 1) capacity)))))

(define buf (fold-left cb-push! (make-circular-buffer 3) '(1 2 3 4 5)))
(display buf)
(newline)
