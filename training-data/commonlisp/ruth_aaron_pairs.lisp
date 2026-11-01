;;; Sum of prime factors counted with multiplicity.
(defun sopfr (n)
  (let ((total 0) (p 2))
    (loop while (<= (* p p) n)
          do (loop while (zerop (mod n p))
                   do (incf total p)
                      (setf n (floor n p)))
             (incf p))
    (if (> n 1) (+ total n) total)))

(format t "~{~a~^ ~}~%"
        (loop for n from 2 below 110 when (= (sopfr n) (sopfr (1+ n))) collect n))
