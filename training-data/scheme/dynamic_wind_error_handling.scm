(dynamic-wind
  (lambda () (display "enter "))
  (lambda () (display "body "))
  (lambda () (display "exit") (newline)))

(define (safe-div a b)
  (call/cc (lambda (k)
    (with-exception-handler
      (lambda (e) (k 'div-by-zero))
      (lambda () (/ a b))))))
(display (safe-div 10 2)) (display " ") (display (safe-div 1 0)) (newline)

(define result
  (guard (e ((symbol? e) (list 'sym e)) ((string? e) (list 'str e)))
    (raise 'oops)))
(display result) (newline)
(display (guard (e (#t (condition/report-string e))) (error "custom failure" 42))) (newline)
