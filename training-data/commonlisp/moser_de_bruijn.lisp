;; Read the binary digits of i as base-4 digits.
(defun moser-de-bruijn (i)
  (let ((value 0) (power 1))
    (loop while (plusp i)
          do (when (logbitp 0 i) (incf value power))
             (setf power (* power 4) i (ash i -1)))
    value))

(format t "~{~a~^ ~}~%" (loop for i below 10 collect (moser-de-bruijn i))) ; 0 1 4 5 16 17 20 21 64 65
