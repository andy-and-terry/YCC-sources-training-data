;; Mutable string operations from R7RS: string-copy, string-copy!, string-fill!.
;; Always copy literals before mutating them.

(define s (string-copy "hello world"))
(string-set! s 0 #\H)
(display s) (newline)

(string-copy! s 6 "WORLD")
(display s) (newline)

(define blank (make-string 5 #\-))
(string-fill! blank #\*)
(display blank) (newline)

(string-fill! blank #\# 1 3)
(display blank) (newline)

(display (string-copy "abcdef" 2 4)) (newline)
(display (string->vector "abc")) (newline)
(display (vector->string #(#\x #\y #\z))) (newline)
(display (string-map char-upcase "shout")) (newline)
(display (string=? (string-copy "same") "same")) (newline)
