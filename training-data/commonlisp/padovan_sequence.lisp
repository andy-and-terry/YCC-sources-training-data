;; Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
(defun padovan (count)
  (let ((p (make-array count :initial-element 1)))
    (loop for i from 3 below count
          do (setf (aref p i) (+ (aref p (- i 2)) (aref p (- i 3)))))
    (coerce p 'list)))

(format t "~{~a~^ ~}~%" (padovan 15))
