#lang racket

(define (build-lps pattern)
  (define n (string-length pattern))
  (define lps (make-vector n 0))
  (let loop ([len 0] [i 1])
    (when (< i n)
      (cond
        [(char=? (string-ref pattern i) (string-ref pattern len))
         (vector-set! lps i (add1 len))
         (loop (add1 len) (add1 i))]
        [(not (= len 0)) (loop (vector-ref lps (sub1 len)) i)]
        [else (vector-set! lps i 0) (loop 0 (add1 i))])))
  lps)

(define (kmp-search text pattern)
  (define lps (build-lps pattern))
  (define n (string-length text))
  (define m (string-length pattern))
  (let loop ([i 0] [j 0])
    (cond
      [(>= i n) -1]
      [(char=? (string-ref text i) (string-ref pattern j))
       (if (= (add1 j) m)
           (- (add1 i) m)
           (loop (add1 i) (add1 j)))]
      [(> j 0) (loop i (vector-ref lps (sub1 j)))]
      [else (loop (add1 i) 0)])))

(displayln (kmp-search "abxabcabcaby" "abcaby"))
