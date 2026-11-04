(defun zigzag (s rows)
  (if (or (= rows 1) (>= rows (length s)))
      s
      (let ((lines (make-array rows :initial-element nil))
            (r 0) (step 1))
        (loop for c across s do
          (push c (aref lines r))
          (cond ((= r 0) (setf step 1))
                ((= r (1- rows)) (setf step -1)))
          (incf r step))
        (coerce (loop for i below rows append (reverse (aref lines i))) 'string))))

(format t "~a~%" (zigzag "PAYPALISHIRING" 3))
