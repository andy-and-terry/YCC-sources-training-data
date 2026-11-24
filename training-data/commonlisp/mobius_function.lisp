;;; Moebius function: 0 if n has a squared prime factor, else (-1)^k.
(defun mobius (n)
  (let ((m n) (p 2) (acc 1))
    (loop
      (cond ((> (* p p) m) (return (if (> m 1) (- acc) acc)))
            ((zerop (mod m p))
             (setf m (floor m p))
             (when (zerop (mod m p)) (return 0))
             (setf acc (- acc))))
      (incf p))))

(format t "~{~a~^ ~}~%" (loop for n from 1 to 30 collect (mobius n)))
