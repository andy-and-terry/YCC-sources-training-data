(define-syntax while
  (syntax-rules ()
    ((_ cond body ...)
     (let lp () (when cond body ... (lp))))))
(define i 0)
(while (< i 3) (display i) (set! i (+ i 1)))
(newline)
