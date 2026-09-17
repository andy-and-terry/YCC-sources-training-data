#lang racket

(define (lcs-length a b)
  (define m (string-length a))
  (define n (string-length b))
  (define dp (build-vector (+ m 1) (lambda (_) (make-vector (+ n 1) 0))))

  (for ([i (in-range 1 (+ m 1))])
    (for ([j (in-range 1 (+ n 1))])
      (define row (vector-ref dp i))
      (define prev-row (vector-ref dp (- i 1)))
      (if (char=? (string-ref a (- i 1)) (string-ref b (- j 1)))
          (vector-set! row j (+ 1 (vector-ref prev-row (- j 1))))
          (vector-set! row j (max (vector-ref prev-row j) (vector-ref row (- j 1)))))))

  (vector-ref (vector-ref dp m) n))

(displayln (lcs-length "abcde" "ace"))
(displayln (lcs-length "abc" "abc"))
(displayln (lcs-length "abc" "def"))
