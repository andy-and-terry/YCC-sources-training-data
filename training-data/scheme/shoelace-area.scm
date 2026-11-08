(define (area pts)
  (let loop ((ps pts) (qs (append (cdr pts) (list (car pts)))) (sum 0))
    (if (null? ps)
        (/ (abs sum) 2)
        (loop (cdr ps) (cdr qs)
              (+ sum (- (* (caar ps) (cdar qs)) (* (caar qs) (cdar ps))))))))

(display (area '((0 . 0) (4 . 0) (4 . 3) (0 . 3))))
(newline)
