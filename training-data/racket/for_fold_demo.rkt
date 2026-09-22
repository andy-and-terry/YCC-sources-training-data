#lang racket

(define numbers (range 1 11))

(define-values (total evens-count)
  (for/fold ([sum 0] [evens 0])
            ([n numbers])
    (values (+ sum n) (if (even? n) (add1 evens) evens))))

(displayln total)
(displayln evens-count)

(define running-max
  (for/fold ([best -inf.0])
            ([n '(3 7 2 9 4)])
    (max best n)))

(displayln running-max)
