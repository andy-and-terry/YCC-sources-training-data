#lang racket
(define (window-hash str)
  (for/fold ([h 0]) ([c (in-string str)])
    (modulo (+ (* h 31) (char->integer c)) 1000003)))

(define s "abcabc")
(for ([i (in-range 0 (- (string-length s) 2))])
  (printf "~a ~a\n" i (window-hash (substring s i (+ i 3)))))
