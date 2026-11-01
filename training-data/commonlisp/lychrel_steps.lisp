;;; Reverse-and-add until a palindrome; count the steps.
(defun rev (n)
  (parse-integer (reverse (princ-to-string n))))

(defun steps (n)
  (loop for count from 0 below 100
        do (when (and (> count 0) (= n (rev n)))
             (return-from steps count))
           (incf n (rev n))
        finally (return -1)))

(format t "~{~a~^ ~}~%" (mapcar #'steps '(56 57 59 79 89)))
