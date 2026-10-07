;; Symbolic differentiation of simple expressions.

(define (variable? e) (symbol? e))
(define (same-var? a b) (and (variable? a) (variable? b) (eq? a b)))

(define (make-sum a b)
  (cond ((and (number? a) (number? b)) (+ a b))
        ((eqv? a 0) b)
        ((eqv? b 0) a)
        (else (list '+ a b))))

(define (make-product a b)
  (cond ((or (eqv? a 0) (eqv? b 0)) 0)
        ((eqv? a 1) b)
        ((eqv? b 1) a)
        ((and (number? a) (number? b)) (* a b))
        (else (list '* a b))))

(define (deriv e v)
  (cond ((number? e) 0)
        ((variable? e) (if (same-var? e v) 1 0))
        ((eq? (car e) '+) (make-sum (deriv (cadr e) v) (deriv (caddr e) v)))
        ((eq? (car e) '*)
         (make-sum (make-product (cadr e) (deriv (caddr e) v))
                   (make-product (deriv (cadr e) v) (caddr e))))
        (else (error "unknown expression" e))))

(write (deriv '(+ x 3) 'x)) (newline)
(write (deriv '(* x y) 'x)) (newline)
(write (deriv '(* (* x y) (+ x 3)) 'x)) (newline)
