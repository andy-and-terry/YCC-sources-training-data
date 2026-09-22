#lang racket

(define (word-break? s word-list)
  (define words (list->set word-list))
  (define n (string-length s))
  (define dp (make-vector (+ n 1) #f))
  (vector-set! dp 0 #t)

  (for ([i (in-range 1 (+ n 1))])
    (for ([j (in-range 0 i)])
      (when (and (vector-ref dp j)
                 (set-member? words (substring s j i)))
        (vector-set! dp i #t))))

  (vector-ref dp n))

(require racket/set)
(define dictionary '("leet" "code" "sand" "and" "cats" "dog"))

(displayln (word-break? "leetcode" dictionary))
(displayln (word-break? "catsandog" dictionary))
