;; R7RS parameters: dynamically scoped values via `make-parameter`/`parameterize`.

(define current-indent (make-parameter 0))

(define (log-line msg)
  (let loop ((n (current-indent)))
    (if (> n 0)
        (begin (display "  ") (loop (- n 1)))))
  (display msg)
  (newline))

(define (with-section title thunk)
  (log-line title)
  (parameterize ((current-indent (+ (current-indent) 1)))
    (thunk)))

(with-section "top"
  (lambda ()
    (log-line "child-1")
    (with-section "nested"
      (lambda ()
        (log-line "grandchild")))
    (log-line "child-2")))

(log-line "back to top level")
