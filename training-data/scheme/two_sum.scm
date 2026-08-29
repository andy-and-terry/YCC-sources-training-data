(define (two-sum nums target)
  (define (helper lst index seen)
    (cond
      ((null? lst) #f)
      (else
       (let* ((n (car lst))
              (complement (- target n))
              (found (assv complement seen)))
         (if found
             (list (cdr found) index)
             (helper (cdr lst) (+ index 1) (cons (cons n index) seen)))))))
  (helper nums 0 '()))

(display (two-sum '(2 7 11 15) 9))
(newline)
