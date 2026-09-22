;; R7RS case-lambda: dispatch a single procedure by argument count.

(define greet
  (case-lambda
    (() "hello, stranger")
    ((name) (string-append "hello, " name))
    ((greeting name) (string-append greeting ", " name))))

(display (greet))
(newline)
(display (greet "world"))
(newline)
(display (greet "hi" "alice"))
(newline)

(define sum-args
  (case-lambda
    ((a) a)
    ((a b) (+ a b))
    ((a b . rest) (apply + a b rest))))

(display (sum-args 1))
(newline)
(display (sum-args 1 2))
(newline)
(display (sum-args 1 2 3 4 5))
(newline)
