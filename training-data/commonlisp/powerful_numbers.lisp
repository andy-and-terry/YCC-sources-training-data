(defun powerful-p (n)
  (loop for p from 2
        while (<= (* p p) n)
        do (when (zerop (mod n p))
             (unless (zerop (mod n (* p p)))
               (return-from powerful-p nil))
             (loop while (zerop (mod n p))
                   do (setf n (floor n p)))))
  (= n 1))

(format t "~{~a ~}~%" (loop for n from 1 to 100 when (powerful-p n) collect n))
