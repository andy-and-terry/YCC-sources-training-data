#lang racket

(define (bsearch vec target)
  (let loop ([lo 0] [hi (sub1 (vector-length vec))])
    (if (> lo hi)
        #f
        (let* ([mid (quotient (+ lo hi) 2)]
               [x (vector-ref vec mid)])
          (cond [(= x target) mid]
                [(< x target) (loop (add1 mid) hi)]
                [else (loop lo (sub1 mid))])))))

(define v (vector 1 3 5 7 9 11))
(displayln (bsearch v 7))
(displayln (bsearch v 4))
(displayln (vector-sort #(5 2 9 1) <))
(define lo-hi
  (let loop ([lo 0] [hi (vector-length v)])
    (if (< lo hi)
        (let ([mid (quotient (+ lo hi) 2)])
          (if (< (vector-ref v mid) 6) (loop (add1 mid) hi) (loop lo mid)))
        lo)))
(displayln lo-hi)
