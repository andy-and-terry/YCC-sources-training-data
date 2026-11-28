(defun column-title (n)
  (let ((chars '()))
    (loop while (> n 0)
          do (decf n)
             (push (code-char (+ 65 (mod n 26))) chars)
             (setf n (floor n 26)))
    (coerce chars 'string)))

(format t "~a ~a~%" (column-title 28) (column-title 701)) ; AB ZY
