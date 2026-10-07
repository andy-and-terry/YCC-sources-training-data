#lang racket

(define (longest-palindrome s)
  (define transformed (string-append "^#" (string-join (map string (string->list s)) "#") "#$"))
  (define n (string-length transformed))
  (define p (make-vector n 0))

  (let loop ([i 1] [center 0] [right 0])
    (when (< i (sub1 n))
      (define mirror (- (* 2 center) i))
      (when (< i right)
        (vector-set! p i (min (- right i) (vector-ref p mirror))))
      (let expand ()
        (when (char=? (string-ref transformed (+ i (vector-ref p i) 1))
                       (string-ref transformed (- i (vector-ref p i) 1)))
          (vector-set! p i (add1 (vector-ref p i)))
          (expand)))
      (if (> (+ i (vector-ref p i)) right)
          (loop (add1 i) i (+ i (vector-ref p i)))
          (loop (add1 i) center right))))

  (define max-len (apply max (vector->list p)))
  (define center-index (for/first ([i (in-range n)] #:when (= (vector-ref p i) max-len)) i))
  (define start (quotient (- center-index max-len 1) 2))
  (substring s start (+ start max-len)))

(displayln (longest-palindrome "babad"))
(displayln (longest-palindrome "cbbd"))
