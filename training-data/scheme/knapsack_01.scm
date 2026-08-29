(define (knapsack items capacity)
  (if (null? items)
      0
      (let* ((weight (caar items))
             (value (cadar items))
             (rest (cdr items))
             (without (knapsack rest capacity)))
        (if (> weight capacity)
            without
            (max without (+ value (knapsack rest (- capacity weight))))))))

(display (knapsack '((2 3) (3 4) (4 5) (5 6)) 5))
(newline)
