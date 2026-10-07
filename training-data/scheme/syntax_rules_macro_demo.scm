;; define-syntax/syntax-rules: hygienic macros for custom control forms.

(define-syntax my-unless
  (syntax-rules ()
    ((_ condition body ...)
     (if condition #f (begin body ...)))))

(define-syntax swap!
  (syntax-rules ()
    ((_ a b)
     (let ((tmp a))
       (set! a b)
       (set! b tmp)))))

(my-unless (> 1 2)
  (display "1 is not greater than 2")
  (newline))

(define x 10)
(define y 20)
(swap! x y)
(display (list x y))
(newline)
