(defun central-delannoy (n)
  (let ((g (make-array (list (1+ n) (1+ n)))))
    (dotimes (i (1+ n))
      (dotimes (j (1+ n))
        (setf (aref g i j)
              (if (or (zerop i) (zerop j))
                  1
                  (+ (aref g (1- i) j) (aref g i (1- j)) (aref g (1- i) (1- j)))))))
    (aref g n n)))

(format t "~{~a~^ ~}~%" (loop for n from 0 to 5 collect (central-delannoy n))) ; 1 3 13 63 321 1683
