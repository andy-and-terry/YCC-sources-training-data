(defun prime-factors (n)
  (let ((factors nil) (divisor 2))
    (loop while (<= (* divisor divisor) n) do
      (loop while (zerop (mod n divisor)) do
        (push divisor factors)
        (setf n (/ n divisor)))
      (incf divisor))
    (when (> n 1) (push n factors))
    (nreverse factors)))

(format t "~a~%" (prime-factors 360))
(format t "~a~%" (prime-factors 97))
