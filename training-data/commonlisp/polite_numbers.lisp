;;; Ways to write n as a sum of two or more consecutive positive integers.
(defun polite-ways (n)
  (loop for k from 2
        while (<= (floor (* k (1+ k)) 2) n)
        count (zerop (mod (- n (floor (* k (1- k)) 2)) k))))

(format t "~{~a~^ ~}~%" (loop for n from 1 to 16 collect (polite-ways n)))
