(define-syntax while
  (syntax-rules ()
    ((_ c body ...) (let lp () (when c body ... (lp))))))
(define i 0)
(while (< i 3) (display i) (set! i (+ i 1)))
(newline)
