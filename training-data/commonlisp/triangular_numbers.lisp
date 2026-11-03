(defun triangular (count)
  (loop for n from 1 to count
        sum n into total
        collect total))

(format t "~a~%" (triangular 10))
