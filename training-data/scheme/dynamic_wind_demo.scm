(define (with-resource name thunk)
  (dynamic-wind
   (lambda () (display "acquire ") (display name) (newline))
   thunk
   (lambda () (display "release ") (display name) (newline))))

(with-resource "file-a"
  (lambda () (display "using file-a") (newline)))

;; dynamic-wind still runs the "after" cleanup even when a continuation
;; captured inside the body is invoked to leave early.
(call-with-current-continuation
 (lambda (escape)
   (with-resource "file-b"
     (lambda ()
       (display "about to bail out") (newline)
       (escape #f)
       (display "this never runs") (newline)))))

(display "done")
(newline)
