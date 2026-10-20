#lang racket
(define-syntax-rule (swap! a b) (let ([t a]) (set! a b) (set! b t)))
(define-syntax-rule (while cond body ...) (let loop () (when cond body ... (loop))))
(define-syntax my-if
  (syntax-rules (then else)
    [(_ c then t else e) (if c t e)]))
(define-syntax-rule (unless* c body ...) (if c (void) (begin body ...)))

(define x 1) (define y 2)
(swap! x y)
(displayln (list x y))
(define i 0)
(while (< i 3) (printf "i=~a " i) (set! i (add1 i)))
(newline)
(displayln (my-if (> 2 1) then 'yes else 'no))
(unless* #f (displayln "ran"))
(define-syntax (show-expr stx)
  (syntax-case stx () [(_ e) #'(printf "~s = ~a\n" 'e e)]))
(show-expr (+ 1 2 3))
