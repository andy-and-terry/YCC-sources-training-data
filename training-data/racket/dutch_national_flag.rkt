#lang racket

(define (dutch-national-flag! vec pivot)
  (define (swap! i j)
    (define tmp (vector-ref vec i))
    (vector-set! vec i (vector-ref vec j))
    (vector-set! vec j tmp))

  (let loop ([low 0] [mid 0] [high (sub1 (vector-length vec))])
    (when (<= mid high)
      (cond
        [(< (vector-ref vec mid) pivot)
         (swap! low mid)
         (loop (add1 low) (add1 mid) high)]
        [(= (vector-ref vec mid) pivot)
         (loop low (add1 mid) high)]
        [else
         (swap! mid high)
         (loop low mid (sub1 high))])))
  vec)

(displayln (dutch-national-flag! (vector 2 0 2 1 1 0) 1))
(displayln (dutch-national-flag! (vector 2 0 1) 1))
