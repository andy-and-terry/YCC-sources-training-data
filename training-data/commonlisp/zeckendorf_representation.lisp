;; Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
(defun fibs-up-to (n)
  (let ((a 1) (b 2) (acc '()))
    (loop while (<= a n)
          do (push a acc)
             (psetf a b b (+ a b)))
    acc))

(defun zeckendorf (n)
  (let ((rest n) (parts '()))
    (dolist (f (fibs-up-to n))
      (when (<= f rest)
        (push f parts)
        (decf rest f)))
    (nreverse parts)))

(format t "~{~a~^ ~}~%" (zeckendorf 100))
