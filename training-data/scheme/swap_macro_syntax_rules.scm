;; Hygienic macros: swap!, while, and unless-like forms.

(define-syntax swap!
  (syntax-rules ()
    ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))

(define-syntax while
  (syntax-rules ()
    ((_ cond body ...)
     (let loop () (when cond body ... (loop))))))

(define-syntax my-or
  (syntax-rules ()
    ((_) #f)
    ((_ e) e)
    ((_ e rest ...) (let ((t e)) (if t t (my-or rest ...))))))

(define x 1)
(define y 2)
(swap! x y)
(display (list x y)) (newline)

(define tmp 99)
(define z 5)
(swap! tmp z)
(display (list tmp z)) (newline)

(define i 0)
(while (< i 3)
  (display i)
  (set! i (+ i 1)))
(newline)

(display (my-or #f #f 7)) (newline)
