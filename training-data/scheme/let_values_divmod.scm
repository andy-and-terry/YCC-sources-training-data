(call-with-values (lambda () (values (quotient 17 5) (remainder 17 5)))
  (lambda (q r) (display (list q r)) (newline)))
