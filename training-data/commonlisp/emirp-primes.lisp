(defun primep (n)
  (and (> n 1)
       (loop for i from 2 to (isqrt n) never (zerop (mod n i)))))

(defun rev (n)
  (parse-integer (reverse (princ-to-string n))))

(format t "~{~a~^ ~}~%"
        (loop for p from 2 below 100
              when (and (primep p) (/= p (rev p)) (primep (rev p)))
                collect p))
