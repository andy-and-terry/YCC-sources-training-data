;; Memoizing a function with an association list in a closure
(define (memoize f)
  (let ((cache '()))
    (lambda (n)
      (let ((hit (assv n cache)))
        (if hit
            (cdr hit)
            (let ((v (f n)))
              (set! cache (cons (cons n v) cache))
              v))))))

(define slow-fib
  (lambda (n) (if (< n 2) n (+ (fast-fib (- n 1)) (fast-fib (- n 2))))))
(define fast-fib (memoize slow-fib))

(display (fast-fib 50)) (newline)
(display (fast-fib 80)) (newline)
