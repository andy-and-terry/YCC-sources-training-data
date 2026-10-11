;; Reverse Polish notation evaluator using an explicit stack.

(define (rpn-eval tokens)
  (let loop ((ts tokens) (stack '()))
    (cond ((null? ts) (car stack))
          ((number? (car ts)) (loop (cdr ts) (cons (car ts) stack)))
          (else
           (let ((b (car stack))
                 (a (cadr stack))
                 (rest (cddr stack)))
             (loop (cdr ts)
                   (cons (case (car ts)
                           ((+) (+ a b))
                           ((-) (- a b))
                           ((*) (* a b))
                           ((/) (/ a b))
                           (else (error "bad operator" (car ts))))
                         rest)))))))

(display (rpn-eval '(3 4 +))) (newline)
(display (rpn-eval '(5 1 2 + 4 * + 3 -))) (newline)
(display (rpn-eval '(2 3 * 10 /))) (newline)
