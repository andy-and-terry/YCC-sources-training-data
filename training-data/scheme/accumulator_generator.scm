;; Closures that carry private mutable state.

(define (make-accumulator total)
  (lambda (amount)
    (set! total (+ total amount))
    total))

(define (make-counter)
  (let ((n 0))
    (lambda ()
      (set! n (+ n 1))
      n)))

(define (make-monitored f)
  (let ((calls 0))
    (lambda (arg)
      (if (eq? arg 'how-many-calls)
          calls
          (begin (set! calls (+ calls 1))
                 (f arg))))))

(define acc (make-accumulator 100))
(acc 10)
(display (acc 10)) (newline)

(define c1 (make-counter))
(define c2 (make-counter))
(c1) (c1)
(display (list (c1) (c2))) (newline)

(define msqrt (make-monitored sqrt))
(msqrt 16) (msqrt 25)
(display (msqrt 'how-many-calls)) (newline)
