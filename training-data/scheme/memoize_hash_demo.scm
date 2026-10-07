;; Memoization with an association-list cache held in a closure.

(define (memoize f)
  (let ((cache '()))
    (lambda args
      (let ((hit (assoc args cache)))
        (if hit
            (cdr hit)
            (let ((result (apply f args)))
              (set! cache (cons (cons args result) cache))
              result))))))

(define call-count 0)

(define slow-square
  (lambda (n)
    (set! call-count (+ call-count 1))
    (* n n)))

(define fast-square (memoize slow-square))
(display (list (fast-square 4) (fast-square 4) (fast-square 5) (fast-square 4)))
(newline)
(display call-count) (newline)

(define memo-fib
  (memoize (lambda (n)
             (if (< n 2) n (+ (memo-fib (- n 1)) (memo-fib (- n 2)))))))
(display (memo-fib 60)) (newline)

(define memo-add (memoize +))
(display (memo-add 1 2 3)) (newline)
(display (memo-add 1 2 3)) (newline)
