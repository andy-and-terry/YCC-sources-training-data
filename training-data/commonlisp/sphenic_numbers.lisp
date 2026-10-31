(defun prime-factors (n)
  (let ((fs '()))
    (loop for p from 2
          while (<= (* p p) n)
          do (loop while (zerop (mod n p))
                   do (push p fs)
                      (setf n (floor n p))))
    (when (> n 1) (push n fs))
    (nreverse fs)))

(defun sphenic-p (n)
  (let ((fs (prime-factors n)))
    (and (= (length fs) 3) (= (length (remove-duplicates fs)) 3))))

(format t "~{~a ~}~%" (loop for n from 2 below 80 when (sphenic-p n) collect n))
