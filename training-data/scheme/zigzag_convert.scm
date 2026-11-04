(define (zigzag s rows)
  (let ((chars (string->list s)))
    (if (or (= rows 1) (>= rows (length chars)))
        s
        (let ((period (* 2 (- rows 1))))
          (define (row-of i)
            (let ((k (modulo i period))) (if (< k rows) k (- period k))))
          (list->string
           (let loop-row ((r 0) (acc '()))
             (if (= r rows)
                 acc
                 (loop-row (+ r 1)
                           (append acc
                                   (let loop ((cs chars) (i 0) (out '()))
                                     (cond ((null? cs) (reverse out))
                                           ((= (row-of i) r) (loop (cdr cs) (+ i 1) (cons (car cs) out)))
                                           (else (loop (cdr cs) (+ i 1) out)))))))))))))

(display (zigzag "PAYPALISHIRING" 3))
(newline)
