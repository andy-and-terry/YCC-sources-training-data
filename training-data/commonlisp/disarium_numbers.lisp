;;; Disarium numbers: digits raised to their 1-based positions sum to n.
(defun disarium-p (n)
  (= n (loop for c across (princ-to-string n)
             for i from 1
             sum (expt (digit-char-p c) i))))

(format t "~{~a~^ ~}~%" (loop for n from 1 below 1000 when (disarium-p n) collect n))
