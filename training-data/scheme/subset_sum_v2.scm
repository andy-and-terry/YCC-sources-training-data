(define (subset-sum? nums target)
  (define n (length nums))
  (define vec (list->vector nums))

  (define (helper i remaining)
    (cond
      ((= remaining 0) #t)
      ((or (< remaining 0) (= i n)) #f)
      (else (or (helper (+ i 1) (- remaining (vector-ref vec i)))
                (helper (+ i 1) remaining)))))

  (helper 0 target))

(display (subset-sum? '(3 34 4 12 5 2) 9))
(newline)
(display (subset-sum? '(3 34 4 12 5 2) 30))
(newline)
(display (subset-sum? '(3 34 4 12 5 2) 100))
(newline)
