;; A tiny unit-test harness built from a macro and counters.

(define passed 0)
(define failed 0)

(define-syntax check
  (syntax-rules (=>)
    ((_ expr => expected)
     (let ((actual expr))
       (if (equal? actual expected)
           (set! passed (+ passed 1))
           (begin
             (set! failed (+ failed 1))
             (display "FAIL: ")
             (write 'expr)
             (display " expected ")
             (write expected)
             (display " got ")
             (write actual)
             (newline)))))))

(check (+ 1 2) => 3)
(check (reverse '(1 2 3)) => '(3 2 1))
(check (string-append "a" "b") => "ab")
(check (* 2 2) => 5)

(display passed) (display " passed, ")
(display failed) (display " failed")
(newline)
