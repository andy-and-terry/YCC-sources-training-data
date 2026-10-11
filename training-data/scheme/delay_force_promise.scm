;; delay and force: a promise runs its body at most once and caches the result.

(define call-count 0)

(define slow-value
  (delay (begin
           (set! call-count (+ call-count 1))
           (display "computing...")
           (newline)
           (* 6 7))))

(display (force slow-value))
(newline)
(display (force slow-value))
(newline)
(display "body ran ")
(display call-count)
(display " time(s)")
(newline)

(define (lazy-or a b)
  (or (force a) (force b)))

(display (lazy-or (delay #t) (delay (car '()))))
(newline)
