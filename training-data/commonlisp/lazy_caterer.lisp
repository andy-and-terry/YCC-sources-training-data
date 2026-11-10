(defun pieces (cuts) (floor (+ (* cuts cuts) cuts 2) 2))

(format t "~{~a~^ ~}~%" (loop for n below 10 collect (pieces n))) ; 1 2 4 7 11 16 22 29 37 46
