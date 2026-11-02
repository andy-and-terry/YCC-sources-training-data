(define (join strs sep)
  (if (null? strs) ""
      (fold-left (lambda (acc s) (string-append acc sep s)) (car strs) (cdr strs))))
(display (join '("a" "b" "c") "-"))
(newline)
