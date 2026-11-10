(defun prime-p (n)
  (and (>= n 2) (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(defun reverse-number (n) (parse-integer (reverse (princ-to-string n))))

(let ((out '()) (n 2))
  (loop while (< (length out) 10)
        do (let ((r (reverse-number n)))
             (when (and (/= r n) (prime-p n) (prime-p r)) (push n out)))
           (incf n))
  (format t "~{~a~^ ~}~%" (reverse out))) ; 13 17 31 37 71 73 79 97 107 113
