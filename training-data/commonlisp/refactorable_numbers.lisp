(defun tau (n) (loop for d from 1 to n count (zerop (mod n d))))

(format t "~{~a~^ ~}~%"
        (loop for n from 1 below 60 when (zerop (mod n (tau n))) collect n))
;; 1 2 8 9 12 18 24 36 40 56
