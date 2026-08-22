(defun binary-search (vec target &optional (low 0) (high (1- (length vec))))
  (if (> low high)
      -1
      (let ((mid (floor (+ low high) 2)))
        (cond
          ((= (aref vec mid) target) mid)
          ((< (aref vec mid) target) (binary-search vec target (1+ mid) high))
          (t (binary-search vec target low (1- mid)))))))

(let ((sorted #(1 3 5 7 9 11 13)))
  (format t "~a~%" (binary-search sorted 7))
  (format t "~a~%" (binary-search sorted 4)))
