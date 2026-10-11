;; Continuation-passing style: every call receives "what to do next".

(define (fact-cps n k)
  (if (= n 0)
      (k 1)
      (fact-cps (- n 1) (lambda (r) (k (* n r))))))

(define (fib-cps n k)
  (if (< n 2)
      (k n)
      (fib-cps (- n 1)
               (lambda (a)
                 (fib-cps (- n 2)
                          (lambda (b) (k (+ a b))))))))

(define (identity x) x)

(fact-cps 6 (lambda (r) (display r) (newline)))
(display (fib-cps 15 identity)) (newline)
(display (fact-cps 5 (lambda (r) (list 'result r)))) (newline)
