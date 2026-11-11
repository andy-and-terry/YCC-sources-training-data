;;; Lazy caterer sequence: max pieces from n cuts
(defun term (n) (+ (floor (* n (+ n 1)) 2) 1))

(format t "~{~a ~}~%" (loop for n from 0 below 10 collect (term n)))
