(defun count-primes-below (n)
  (if (< n 3)
      0
      (let ((composite (make-array n :element-type 'bit :initial-element 0))
            (count 0))
        (loop for i from 2 below n
              when (zerop (aref composite i))
                do (incf count)
                   (loop for j from (* i i) below n by i
                         do (setf (aref composite j) 1)))
        count)))

(format t "~a~%" (count-primes-below 100))
