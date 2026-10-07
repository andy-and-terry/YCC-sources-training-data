#lang racket

;; A tiny arithmetic evaluator over S-expressions with variables.
(define (evaluate expr env)
  (match expr
    [(? number? n) n]
    [(? symbol? s) (hash-ref env s (lambda () (error 'evaluate "unbound variable: ~a" s)))]
    [`(+ ,a ,b) (+ (evaluate a env) (evaluate b env))]
    [`(* ,a ,b) (* (evaluate a env) (evaluate b env))]
    [`(- ,a ,b) (- (evaluate a env) (evaluate b env))]
    [`(let ([,x ,e]) ,body)
     (evaluate body (hash-set env x (evaluate e env)))]
    [`(if ,c ,t ,f) (if (zero? (evaluate c env)) (evaluate f env) (evaluate t env))]
    [_ (error 'evaluate "bad expression: ~a" expr)]))

(displayln (evaluate '(+ 1 (* 2 3)) (hash)))
(displayln (evaluate '(let ([x 5]) (* x x)) (hash)))
(displayln (evaluate '(if (- 3 3) 10 20) (hash)))
(displayln (with-handlers ([exn:fail? exn-message])
             (evaluate '(+ y 1) (hash))))
