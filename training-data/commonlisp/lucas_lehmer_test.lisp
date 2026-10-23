;; Lucas-Lehmer test: Mersenne prime exponents p <= 19.
(defun primep (n)
  (and (>= n 2)
       (loop for d from 2 to (isqrt n)
             never (zerop (mod n d)))))

(defun lucas-lehmer-p (p)
  (if (= p 2)
      t
      (let ((m (- (expt 2 p) 1))
            (s 4))
        (dotimes (i (- p 2))
          (setf s (mod (- (* s s) 2) m)))
        (zerop s))))

(format t "~{~a~^ ~}~%"
        (loop for p from 2 to 19
              when (and (primep p) (lucas-lehmer-p p)) collect p))
