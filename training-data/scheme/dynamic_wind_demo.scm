(define trace '())

(define (log! tag) (set! trace (cons tag trace)))

(define (with-tracking thunk)
  (dynamic-wind
   (lambda () (log! 'enter))
   thunk
   (lambda () (log! 'leave))))

(call-with-current-continuation
 (lambda (k)
   (with-tracking
    (lambda ()
      (log! 'body)
      (k 'escaped)))))

(display (reverse trace))
(newline)
