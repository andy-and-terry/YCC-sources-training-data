;; R7RS string ports: build a string incrementally with an output
;; port, and read structured data back out of an input string port.

(define (join-with-commas lst)
  (let ((out (open-output-string)))
    (let loop ((xs lst) (first? #t))
      (cond ((null? xs) (get-output-string out))
            (else
             (if (not first?) (write-char #\, out))
             (write (car xs) out)
             (loop (cdr xs) #f))))))

(define (sum-from-string s)
  (let ((in (open-input-string s)))
    (let loop ((total 0))
      (let ((n (read in)))
        (if (eof-object? n)
            total
            (loop (+ total n)))))))

(display (join-with-commas '(1 2 3 "four" 5)))
(newline)
(display (sum-from-string "10 20 30 40"))
(newline)
