;;; Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
(defun perrin-numbers (count)
  (loop repeat count
        for a = 3 then b
        for b = 0 then c
        for c = 2 then (+ a b)
        collect a))

(format t "~{~d~^ ~}~%" (perrin-numbers 15))
