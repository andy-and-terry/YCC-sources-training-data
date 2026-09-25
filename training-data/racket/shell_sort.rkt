#lang racket

;; Shell sort generalizes insertion sort by first comparing elements
;; far apart (a large gap) and shrinking the gap toward 1, so early
;; passes move far-out-of-place elements most of the way home.
(define (shell-sort! vec)
  (define n (vector-length vec))
  (let gap-loop ([gap (quotient n 2)])
    (when (> gap 0)
      (for ([i (in-range gap n)])
        (define temp (vector-ref vec i))
        (let insert-loop ([j i])
          (cond
            [(and (>= j gap) (> (vector-ref vec (- j gap)) temp))
             (vector-set! vec j (vector-ref vec (- j gap)))
             (insert-loop (- j gap))]
            [else (vector-set! vec j temp)])))
      (gap-loop (quotient gap 2))))
  vec)

(displayln (shell-sort! (vector 9 5 1 4 3 8 2 7)))
