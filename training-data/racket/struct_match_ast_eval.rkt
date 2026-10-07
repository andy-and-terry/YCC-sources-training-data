#lang racket

(struct num (n) #:transparent)
(struct add (l r) #:transparent)
(struct mul (l r) #:transparent)
(struct neg (e) #:transparent)
(struct var (name) #:transparent)

(define (evaluate expr env)
  (match expr
    [(num n) n]
    [(var x) (hash-ref env x)]
    [(add l r) (+ (evaluate l env) (evaluate r env))]
    [(mul l r) (* (evaluate l env) (evaluate r env))]
    [(neg e) (- (evaluate e env))]))

(define (simplify expr)
  (match expr
    [(add (num 0) e) (simplify e)]
    [(add e (num 0)) (simplify e)]
    [(mul (num 1) e) (simplify e)]
    [(mul e (num 1)) (simplify e)]
    [(mul (num 0) _) (num 0)]
    [(mul _ (num 0)) (num 0)]
    [(neg (neg e)) (simplify e)]
    [(add l r) (add (simplify l) (simplify r))]
    [(mul l r) (mul (simplify l) (simplify r))]
    [_ expr]))

(define (show expr)
  (match expr
    [(num n) (number->string n)]
    [(var x) (symbol->string x)]
    [(add l r) (format "(~a + ~a)" (show l) (show r))]
    [(mul l r) (format "~a * ~a" (show l) (show r))]
    [(neg e) (format "-~a" (show e))]))

(define e (add (mul (num 1) (var 'x)) (add (num 0) (neg (neg (num 5))))))
(displayln (show e))
(displayln (simplify e))
(displayln (show (simplify e)))
(displayln (evaluate e (hash 'x 10)))
