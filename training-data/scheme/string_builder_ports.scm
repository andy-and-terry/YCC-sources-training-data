;; Build strings efficiently with string ports and string-append.

(define (join strs sep)
  (if (null? strs)
      ""
      (let loop ((rest (cdr strs)) (acc (car strs)))
        (if (null? rest)
            acc
            (loop (cdr rest) (string-append acc sep (car rest)))))))

(define (repeat-string s n)
  (call-with-output-string
    (lambda (port)
      (do ((i 0 (+ i 1))) ((= i n))
        (write-string s port)))))

(display (join '("a" "b" "c") ", "))
(newline)
(display (repeat-string "ab" 3))
(newline)
(display (number->string 255 16))
(newline)
(display (list->string (reverse (string->list "scheme"))))
(newline)
