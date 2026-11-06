;; Repunits: numbers made only of the digit 1.
(define (repunits count)
  (let loop ((i 0) (r 0) (acc '()))
    (if (= i count)
        (reverse acc)
        (let ((next (+ (* r 10) 1)))
          (loop (+ i 1) next (cons next acc))))))

(display (repunits 5))
(newline)
