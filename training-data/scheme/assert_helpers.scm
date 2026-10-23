;; A tiny assertion helper and test runner using only core Scheme.

(define passed 0)
(define failed 0)

(define (check name expected actual)
  (if (equal? expected actual)
      (set! passed (+ passed 1))
      (begin
        (set! failed (+ failed 1))
        (display "FAIL ") (display name)
        (display ": expected ") (write expected)
        (display ", got ") (write actual)
        (newline))))

(define (square x) (* x x))
(define (reverse-list lst)
  (let loop ((l lst) (acc '()))
    (if (null? l) acc (loop (cdr l) (cons (car l) acc)))))

(check "square of 5" 25 (square 5))
(check "reverse" '(3 2 1) (reverse-list '(1 2 3)))
(check "string append" "ab" (string-append "a" "b"))
(check "deliberate failure" 10 (square 3))
(check "symbols" 'ok (car '(ok)))

(display passed) (display " passed, ")
(display failed) (display " failed")
(newline)
