#lang racket

;; syntax-rules ellipsis patterns let a macro accept a variable
;; number of sub-forms and expand each one uniformly.
(define-syntax my-or
  (syntax-rules ()
    [(_) #f]
    [(_ e) e]
    [(_ e1 e2 ...)
     (let ([t e1])
       (if t t (my-or e2 ...)))]))

(displayln (my-or #f #f 3 (error "never evaluated")))
(displayln (my-or #f #f))

;; A macro that builds a list of thunks and calls them all,
;; collecting results -- demonstrates ellipsis over paired bindings.
(define-syntax my-let*
  (syntax-rules ()
    [(_ () body ...) (begin body ...)]
    [(_ ([id val] rest ...) body ...)
     (let ([id val]) (my-let* (rest ...) body ...))]))

(displayln (my-let* ([x 1] [y (+ x 1)] [z (+ y 1)]) (list x y z)))

;; Variadic swap-and-collect: pairs up arguments two at a time.
(define-syntax-rule (make-pairs a b ...)
  (list (cons a 'first) (cons b 'rest) ...))

(displayln (make-pairs 1 2 3 4))
