(defun prime-factor-count (n)
  (let ((count 0))
    (loop for p from 2
          while (<= (* p p) n)
          do (loop while (zerop (mod n p))
                   do (setf n (floor n p))
                      (incf count)))
    (if (> n 1) (1+ count) count)))

(format t "~{~a ~}~%" (loop for n from 2 below 30
                             when (= (prime-factor-count n) 2) collect n))
