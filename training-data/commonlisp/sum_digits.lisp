(defun sum-digits (n)
  (let ((total 0))
    (loop while (> n 0) do
      (incf total (mod n 10))
      (setf n (floor n 10)))
    total))

(print (sum-digits 12345))
