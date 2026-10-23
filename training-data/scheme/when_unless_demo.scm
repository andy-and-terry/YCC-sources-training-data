;; `when` and `unless` are one-armed conditionals with an implicit begin.
(define (report-temp t)
  (when (> t 30)
    (display "hot")
    (newline))
  (unless (> t 30)
    (display "not hot")
    (newline)))

(report-temp 35)
(report-temp 20)

;; The body of `when` can hold several expressions; the last is the value.
(display (when (> 3 2) 'a 'b 'c))
(newline)

;; Typical use: guard side effects in a loop.
(define (print-evens lst)
  (for-each
   (lambda (x)
     (when (even? x)
       (display x)
       (display " ")))
   lst)
  (newline))

(print-evens '(1 2 3 4 5 6))
