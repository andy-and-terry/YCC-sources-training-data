(define (min-coins-helper coins amount memo)
  (cond
    ((= amount 0) 0)
    ((< amount 0) -1)
    (else
     (let ((results (filter (lambda (x) (>= x 0))
                             (map (lambda (c)
                                    (let ((sub (min-coins-helper coins (- amount c) memo)))
                                      (if (>= sub 0) (+ sub 1) -1)))
                                  coins))))
       (if (null? results) -1 (apply min results))))))

(define (min-coins coins amount)
  (min-coins-helper coins amount '()))

(display (min-coins '(1 2 5) 11))
(newline)
