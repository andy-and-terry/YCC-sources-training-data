#lang racket

(define-syntax-rule (swap! a b)
  (let ([tmp a]) (set! a b) (set! b tmp)))

(define p 1)
(define q 2)
(swap! p q)
(displayln (list p q))

(define-syntax-rule (while cond body ...)
  (let loop ()
    (when cond
      body ...
      (loop))))

(define i 0)
(while (< i 3)
  (printf "i=~a\n" i)
  (set! i (add1 i)))

(define-syntax my-or
  (syntax-rules ()
    [(_) #f]
    [(_ e) e]
    [(_ e rest ...) (let ([t e]) (if t t (my-or rest ...)))]))
(displayln (my-or #f #f 3))

(define-syntax-rule (unless2 c body ...) (if c (void) (begin body ...)))
(unless2 #f (displayln "ran"))
(define-syntax-rule (repeat n body ...) (for ([_ (in-range n)]) body ...))
(repeat 2 (display "x"))
(newline)
