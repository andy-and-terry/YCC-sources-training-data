;;; Narayana's cows N(n)=N(n-1)+N(n-3)
(let ((v (make-array 10 :initial-element 0)))
  (setf (aref v 0) 1 (aref v 1) 1 (aref v 2) 1)
  (loop for i from 3 below 10
        do (setf (aref v i) (+ (aref v (- i 1)) (aref v (- i 3)))))
  (format t "~{~a ~}~%" (coerce v 'list)))
