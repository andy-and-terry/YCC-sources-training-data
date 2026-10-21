;;; Print the first 15 Pell numbers: P(n) = 2*P(n-1) + P(n-2)
(defun pell-numbers (count)
  (loop repeat count
        for a = 0 then b
        for b = 1 then (+ (* 2 b) a)
        collect a))

(loop for p in (pell-numbers 15)
      for i from 0
      do (format t "P(~d) = ~d~%" i p))
