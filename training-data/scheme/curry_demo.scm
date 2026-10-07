;; Currying and partial application: turning a two-argument function into
;; a chain of one-argument functions, and pre-filling some arguments.

(define (curry2 f) (lambda (x) (lambda (y) (f x y))))

(define curried-add (curry2 +))
(define add-five (curried-add 5))

(define (partial f . fixed-args)
  (lambda more-args (apply f (append fixed-args more-args))))

(define add-three-nums (lambda (a b c) (+ a b c)))
(define add-to-ten-and-twenty (partial add-three-nums 10 20))

(display (add-five 3))
(newline)
(display (map add-five '(1 2 3)))
(newline)
(display (add-to-ten-and-twenty 5))
(newline)
