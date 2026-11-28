(defun gould (n) (ash 1 (logcount n)))

(format t "~{~a~^ ~}~%" (loop for n below 16 collect (gould n)))
