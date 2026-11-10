(defun prime-p (n)
  (and (>= n 2) (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(let ((out '()) (p 2))
  (loop while (< (length out) 10)
        do (when (and (prime-p p) (prime-p (1+ (* 2 p)))) (push p out))
           (incf p))
  (format t "~{~a~^ ~}~%" (reverse out))) ; 2 3 5 11 23 29 41 53 83 89
