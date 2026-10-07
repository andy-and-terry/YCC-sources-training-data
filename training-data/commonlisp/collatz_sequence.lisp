(defun collatz-sequence (n)
  (let ((sequence (list n)))
    (loop while (/= n 1) do
      (setf n (if (evenp n) (/ n 2) (1+ (* 3 n))))
      (push n sequence))
    (nreverse sequence)))

(let ((seq (collatz-sequence 27)))
  (format t "~a~%" seq)
  (format t "steps: ~a~%" (1- (length seq))))
