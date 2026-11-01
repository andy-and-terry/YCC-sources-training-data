;; n is triangular iff 8n + 1 is a perfect square.
(define (triangular? n)
  (let* ((s (+ (* 8 n) 1))
         (r (exact (round (sqrt s)))))
    (= (* r r) s)))

(let loop ((n 0))
  (when (<= n 20)
    (when (triangular? n) (display n) (display " "))
    (loop (+ n 1))))
(newline)
