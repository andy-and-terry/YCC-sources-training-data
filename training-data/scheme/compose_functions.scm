;; Function composition and pipelines
(define (compose . fs)
  (if (null? fs)
      (lambda (x) x)
      (lambda (x) ((car fs) ((apply compose (cdr fs)) x)))))

(define (pipe . fs)
  (apply compose (reverse fs)))

(define inc (lambda (x) (+ x 1)))
(define dbl (lambda (x) (* x 2)))

(display ((compose inc dbl) 5)) (newline)
(display ((pipe inc dbl) 5)) (newline)
(display ((compose) 42)) (newline)
