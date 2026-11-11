;;; Perrin sequence P(n)=P(n-2)+P(n-3)
(let ((v (make-array 10 :initial-element 0)))
  (setf (aref v 0) 3 (aref v 1) 0 (aref v 2) 2)
  (loop for i from 3 below 10
        do (setf (aref v i) (+ (aref v (- i 2)) (aref v (- i 3)))))
  (format t "~{~a ~}~%" (coerce v 'list)))
