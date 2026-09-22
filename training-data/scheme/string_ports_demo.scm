;; R7RS string ports: build up a string in memory with an output string
;; port, then re-parse it token by token with an input string port.

(define (numbers->string nums)
  (let ((port (open-output-string)))
    (for-each
      (lambda (n)
        (write n port)
        (write-char #\space port))
      nums)
    (get-output-string port)))

(define (string->numbers str)
  (let ((port (open-input-string str)))
    (let loop ((acc '()))
      (let ((x (read port)))
        (if (eof-object? x)
            (reverse acc)
            (loop (cons x acc)))))))

(define serialized (numbers->string '(1 2 3 42 -7)))
(display serialized)
(newline)
(display (string->numbers serialized))
(newline)
