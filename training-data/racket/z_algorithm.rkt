#lang racket

(define (z-array s)
  (define n (string-length s))
  (define z (make-vector n 0))
  (let loop ([i 1] [left 0] [right 0])
    (when (< i n)
      (define start
        (if (<= i right)
            (min (- right i -1) (vector-ref z (- i left)))
            0))
      (vector-set! z i start)
      (let expand ()
        (when (and (< (+ i (vector-ref z i)) n)
                   (char=? (string-ref s (vector-ref z i))
                           (string-ref s (+ i (vector-ref z i)))))
          (vector-set! z i (add1 (vector-ref z i)))
          (expand)))
      (define new-right (+ i (vector-ref z i) -1))
      (if (> new-right right)
          (loop (add1 i) i new-right)
          (loop (add1 i) left right))))
  z)

(define (z-search text pattern)
  (define combined (string-append pattern "$" text))
  (define z (z-array combined))
  (define m (string-length pattern))
  (for/list ([i (in-range (vector-length z))]
             #:when (= (vector-ref z i) m))
    (- i m 1)))

(displayln (z-search "abxabcabcaby" "abcaby"))
