;;; Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
(defun bouncy-p (n)
  (let* ((d (princ-to-string n))
         (up (sort (copy-seq d) #'char<))
         (down (sort (copy-seq d) #'char>)))
    (and (string/= d up) (string/= d down))))

(format t "~a~%" (count-if #'bouncy-p (loop for n from 1 below 1000 collect n)))
