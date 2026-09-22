#lang racket

;; Subset-sum decision problem via bottom-up dynamic programming.
;; reachable[i] is #t if some subset of the first i-considered values
;; sums exactly to i.

(define (subset-sum? values target)
  (define reachable (make-vector (+ target 1) #f))
  (vector-set! reachable 0 #t)
  (for ([v values])
    (for ([s (in-range target -1 -1)])
      (when (and (>= s v) (vector-ref reachable (- s v)))
        (vector-set! reachable s #t))))
  (vector-ref reachable target))

(displayln (subset-sum? '(3 34 4 12 5 2) 9))   ; #t  (4+5)
(displayln (subset-sum? '(3 34 4 12 5 2) 10))  ; #t  (3+5+2)
(displayln (subset-sum? '(3 34 4 12 5 2) 13))  ; #f
(displayln (subset-sum? '() 0))                ; #t
