(defun subset-sum-p (numbers target)
  (let* ((n (length numbers))
         (nums (coerce numbers 'vector))
         (dp (make-array (list (1+ n) (1+ target)) :initial-element nil)))
    (dotimes (i (1+ n)) (setf (aref dp i 0) t))
    (loop for i from 1 to n do
      (loop for s from 1 to target do
        (setf (aref dp i s)
              (or (aref dp (1- i) s)
                  (and (>= s (aref nums (1- i)))
                       (aref dp (1- i) (- s (aref nums (1- i)))))))))
    (aref dp n target)))

(format t "~a~%" (subset-sum-p '(3 34 4 12 5 2) 9))
(format t "~a~%" (subset-sum-p '(3 34 4 12 5 2) 10))
