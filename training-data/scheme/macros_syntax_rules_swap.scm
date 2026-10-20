(define-syntax swap!
  (syntax-rules () ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))
(define-syntax my-unless
  (syntax-rules () ((_ c body ...) (if c #f (begin body ...)))))
(define-syntax for
  (syntax-rules (in) ((_ x in lst body ...) (for-each (lambda (x) body ...) lst))))
(define-syntax my-or
  (syntax-rules () ((_) #f) ((_ e) e) ((_ e r ...) (let ((t e)) (if t t (my-or r ...))))))

(define a 1) (define b 2)
(swap! a b)
(display (list a b)) (newline)
(display (my-unless #f 'ran)) (newline)
(for n in '(1 2 3) (display (* n n)) (display " ")) (newline)
(define t 5)
(display (my-or #f t)) (newline)
