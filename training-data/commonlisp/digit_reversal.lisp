(defun reverse-digits (n)
  (let ((reversed 0))
    (loop while (> n 0) do
      (setf reversed (+ (* reversed 10) (mod n 10)))
      (setf n (floor n 10)))
    reversed))

(format t "~a~%" (reverse-digits 12345))
(format t "~a~%" (reverse-digits 900))
