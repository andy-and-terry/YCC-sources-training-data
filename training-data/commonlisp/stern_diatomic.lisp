(defun stern (count)
  (let ((seq (make-array count :initial-element 0)))
    (setf (aref seq 1) 1)
    (loop for i from 2 below count
          for h = (floor i 2)
          do (setf (aref seq i)
                   (if (evenp i)
                       (aref seq h)
                       (+ (aref seq h) (aref seq (1+ h))))))
    (coerce seq 'list)))

(print (stern 15)) ; (0 1 1 2 1 3 2 3 1 4 3 5 2 5 3)
