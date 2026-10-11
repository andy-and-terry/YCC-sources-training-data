#lang racket

;; Build strings efficiently with output string ports.
(define (join-with sep strs)
  (define out (open-output-string))
  (for ([s (in-list strs)] [i (in-naturals)])
    (when (> i 0) (write-string sep out))
    (write-string s out))
  (get-output-string out))

(displayln (join-with ", " '("a" "b" "c")))
(displayln (string-join '("x" "y") "-"))

(define o (open-output-string))
(fprintf o "~a-~s" "hi" "hi")
(write 42 o)
(displayln (get-output-string o))
(displayln (with-output-to-string (lambda () (display "captured") (display 1))))
